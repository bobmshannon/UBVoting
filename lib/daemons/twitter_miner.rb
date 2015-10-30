#!/usr/bin/env ruby
require File.expand_path('../../../config/environment', __FILE__)
include Twitter::Autolink

# Topics to track on Twitter (related to 2016 presidential election).
#
# As per Twitter API docs the maximum number of topics that can be
# tracked is 400. See https://dev.twitter.com/streaming/public.
TOPICS = [
    '#Trump2016', '#Hilary2016', '#Rand2016', '#Jeb2016', '#Christie2016', '#FeelTheBern',
    '#Cruz2016', '#Biden2016', '#Fiorina2016', '#PresidentialElection', '#DemDebate'
]

# Maximum number of tweets from a single user that will be broadcasted
# over the web socket. Default unit is tweets per minute.
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
    WebsocketRails[:tweets].trigger(:new_tweet, tweet.to_json)
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
	    # Initialize twitter stream and track specified topics
	    streamclient.filter(track: TOPICS.join(',')) do |object|
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
