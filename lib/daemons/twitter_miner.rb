#!/usr/bin/env ruby
require File.expand_path('../../../config/environment', __FILE__)
include Twitter::Autolink

# Topics to track on Twitter (related to 2016 presidential election).
#
# As per Twitter API docs the maximum number of topics that can be
# tracked is 400. See https://dev.twitter.com/streaming/public.
TOPICS = [
    '#PresidentialElection',
    '#DemDebate', 
    '#GOPDebate',
    '#2016',
    'Martin O Malley', 
    'Bernie Sanders', 
    'Hillary Clinton', 
    'Jeb Bush',
    'Ben Carson',
    'Chris Christie',
    'Ted Cruz',
    'Carly Fiorina',
    'Jim Gilmore',
    'Lindsey Graham',
    'Mike Huckabee',
    'Bobby Jindal',
    'John Kasich',
    'George Pataki',
    'Rand Paul',
    'Marco Rubio',
    'Rick Santorum',
    'Donald Trump'
]

# Maximum number of tweets from a single user that will be broadcasted
# over the web socket. Default rate limit is set to
# 1 tweet per X minutes.
# 
# Examples:
# 1.minutes --> 1 tweet per minute
# 5.minutes --> 1 tweet per 5 minutes
# 15.minutes --> 1 tweet per 15 minutes
TWEET_THRESHOLD = 1.minutes

# Stores a tweet object in the database.
#
# Params:
# +tweet+:: tweet object returned from Twitter API client
def store_tweet(tweet)
    Tweet.create(
        text: tweet.text,
        id: tweet.id,
        lang: tweet.lang,
        source: tweet.source,
        retweet_count: tweet.retweet_count,
        favorite_count: tweet.favorite_count,
        created_at: tweet.created_at,
        url: tweet.uri
    )
end

# Update the specified activity entry in the database, or create
# a new one if necessary.
#
# Params:
# +screen_name+:: twitter handle string
def record_activity(screen_name)
    begin
        entry = TweetActivity.find_by(screen_name: screen_name)
        entry[:time] = Time.now.to_i
        entry.save
    rescue Mongoid::Errors::DocumentNotFound
        store_activity(screen_name, Time.now.to_i)
    end
end

# Stores a tweet activity object in the database. Used for enforcing rate limiting.
#
# Params:
# +tweet+:: tweet object returned from Twitter API client
def store_activity(screen_name, time)
    TweetActivity.create(
        screen_name: screen_name,
        time: time
    )
end

# Check whether a specified twitter handle is rate limited or not.
#
# Params:
# +screen_name+:: twitter handle string
#
# Returns:
# true/false
def is_rate_limited(screen_name)
    begin
        entry = TweetActivity.find_by(screen_name: screen_name)

        if entry[:time] + TWEET_THRESHOLD.to_i < Time.now.to_i
            return false
        else
            return true
        end
    rescue Mongoid::Errors::DocumentNotFound
        return false
    end
end

# Do some filtering before a tweet is sent over the websocket.
# 
# Params:
# +tweet+:: tweet object returned from Twitter API client
# 
# Returns:
# true if tweet matches any filter rules
# false otherwise
def is_filtered(tweet)
    if tweet[:geo] or tweet[:coordinates] or tweet[:place]
        return false
    end
    
    return true
end

# Push a tweet over the web socket channel.
#
# Params:
# +tweet+:: tweet object returned from Twitter API client
def broadcast_tweet(tweet)
    tweet = tweet.to_h
    html = auto_link(tweet[:text])
    tweet[:text_html] = html

    # Send tweet to all clients listening on "tweets" channel
    # and then trigger a "new_tweet" event on the client side.
    unless is_filtered(tweet)
    	coords = Geocoder.coordinates(tweet[:place][:full_name])
    	tweet[:coordinates] = coords
        WebsocketRails[:tweets].trigger(:new_tweet, tweet.to_json)
    end
end

$running = true
Signal.trap("TERM") do
    $running = false
end

while($running) do
    # Twitter Streaming API Client
    streamclient = Twitter::Streaming::Client.new do |config|
        config.consumer_key = ENV['consumer_key']
        config.consumer_secret = ENV['consumer_secret']
        config.access_token = ENV['access_token']
        config.access_token_secret = ENV['access_token_secret']
    end

    begin
        # Twitter stream options
        options = {
            track: TOPICS.join(','),
        }
        # Initialize twitter stream and track specified topics
        streamclient.filter(options) do |object|
            if object.is_a?(Twitter::Tweet)
                # Get the tweeter's screen name
                screen_name = object.user.screen_name

                # Store tweet in database
                store_tweet(object)

                unless is_rate_limited(screen_name)
                    # Broadcast tweet if user is not rate limited
                    broadcast_tweet(object)

                    # Record a tweeter's activity (for rate limiting)
                    record_activity(screen_name)
                end
            end
        end
    rescue Twitter::Error
        next
    end
end
