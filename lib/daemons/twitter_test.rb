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
# When done change back to original key/secrets
streamclient = Twitter::Streaming::Client.new do |config|
	config.consumer_key = "pe8rdOdgOy5zq4ak5yTYw50Im"
	config.consumer_secret = "KqhIKA9QmkSEUSuLF7TYGHQ0zWUxIL4qzfruyJDfemPc1ODx4Q"
	config.access_token = "3660084016-jhf8ez8JnbggZDhSYTBY2a4CoXYx5DNhuVjObbj"
	config.access_token_secret = "OD4dMugA3PUJGcoNzxd4QAaZA8EvKY0OF8DVsum0ErUJ6"
end

$running = true
Signal.trap("TERM") do 
  $running = false
end

limitHashmap = Hash.new 
 


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
			puts " <----------------------------->"		
			puts tweet_activity.screen_name

			puts " <----------------------------->"
		elsif (limitHashmap.has_key? (username) and limitHashmap[username] >currentTime)
			tweet_activity = TweetActivity.create(
			  	screen_name: object.user.screen_name,
			  	time: allowedTime,
			  	)
			puts "The thing that follows ------>"
			#puts TweetActivity.where(screen_name: username)		
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
