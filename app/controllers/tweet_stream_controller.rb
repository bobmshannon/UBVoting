class TweetStreamController < WebsocketRails::BaseController
	def initialize_session
		# perform application setup here
	end

	def client_connected
		# client connected callback method
		msg = "Socket Connection Successful"
		send_message :connected, msg
	end

	def new_tweet
	end
end
