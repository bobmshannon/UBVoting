#!/usr/bin/env ruby
require File.expand_path('../../../config/environment', __FILE__)

# Topics to track on Twitter (related to 2016 presidential election).
# 
# As per Twitter API docs the maximum number of topics that can be
# tracked is 400. See https://dev.twitter.com/streaming/public.
TOPICS = [
			'#Trump2016', '#Hilary2016', '#Rand2016', '#Jeb2016', '#Christie2016', '#FeelTheBern',
			'#Cruz2016', '#Biden2016', '#Fiorina2016', '#PresidentialElection', '#DemDebate'
		]

# Twitter API Authentication
CONSUMER_KEY = 'hvWaAIoUXTseFppzXYqqp3dXm'
CONSUMER_SECRET = 'mTRw5vCSlm23WHnRLEzyjQDoaOKjAKLNLk9H7I1DuTdDGe6jUJ'
ACCESS_TOKEN = '1024940624-X5yzRS7ODH6K4ZfLKWAe1VNHhjzOzEc0FROMTx7'
ACCESS_TOKEN_SECRET = 'GpXkul8flPI16egRoYkyqlKQJzW6R9K63Nc1xKtcjjRrh'

# Twitter Streaming API Client
streamclient = Twitter::Streaming::Client.new do |config|
	config.consumer_key = CONSUMER_KEY
	config.consumer_secret = CONSUMER_SECRET
	config.access_token = ACCESS_TOKEN
	config.access_token_secret = ACCESS_TOKEN_SECRET
end

$running = true
Signal.trap("TERM") do 
  $running = false
end

WebsocketRails[:tweets].trigger(:new_tweet, "streaming tweets...")

while($running) do
  # Initiate twitter stream and track specified topics
  streamclient.filter(track: TOPICS.join(',')) do |object|
    if object.is_a?(Twitter::Tweet)
	  # Create a new tweet object and store it in the database
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

	  WebsocketRails[:tweets].trigger(:new_tweet, object.to_h.to_json)
	end
  end

  sleep 10
end
