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

# Twitter Streaming API Client
streamclient = Twitter::Streaming::Client.new do |config|
	config.consumer_key = ENV['consumer_key']
	config.consumer_secret = ENV['consumer_secret']
	config.access_token = ENV['access_token']
	config.access_token_secret = ENV['access_token_secret']
end

$running = true
Signal.trap("TERM") do 
  $running = false
end

while($running) do
  # Initiate twitter stream and track specified topics
  streamclient.filter(track: TOPICS.join(',')) do |object|
    if object.is_a?(Twitter::Tweet)
	  # Create a new tweet object and store it in the database
		currentTime = Time.new
		allowedTime = currentTime + 100
		username = object.user.screen_name
		
		if ((limitHashmap.has_key? (username))== false)
			limitHashmap[username] = allowedTime
			tweet_activity= TweetActivity.create(
			  	screen_name: object.user.screen_name,
			  	time: allowedTime,
			)
			 tweet = Tweet.create(
			    text: object.text,
			  	id: object.id,
			  	lang: object.lang,
			  	source: object.source,
			  	retweet_count: object.retweet_count,
			  	favorite_count: object.favorite_count,
			  	created_at: object.created_at,
			  	url: object.uri,
			  	#coordinates: coords,
			  	#profile_image_url: restclient.status(object.id).user.profile_image_url
			  	#hashtags: hashtags,
			  	#user_mentions: user_mentions
		  	)		

		elsif (limitHashmap.has_key? (username) and limitHashmap[username] >currentTime)
			tweet_activity = TweetActivity.create(
			  	screen_name: object.user.screen_name,
			  	time: allowedTime,
			  	)
			 tweet = Tweet.create(
			    text: object.text,
			  	id: object.id,
			  	lang: object.lang,
			  	source: object.source,
			  	retweet_count: object.retweet_count,
			  	favorite_count: object.favorite_count,
			  	created_at: object.created_at,
			  	url: object.uri,
			  	#coordinates: coords,
			  	#profile_image_url: restclient.status(object.id).user.profile_image_url
			  	#hashtags: hashtags,
			  	#user_mentions: user_mentions
			  )
		end

      tweet = object.to_h
      html = auto_link(tweet[:text])
      tweet[:text_html] = html

	  # Send tweet to all clients listening on web socket channel
	  WebsocketRails[:tweets].trigger(:new_tweet, tweet.to_json)
	end
  end

  sleep 10
end