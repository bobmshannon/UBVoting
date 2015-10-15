class TweetStreamController < ApplicationController
	def list
		@hash_tags = [
			'#Trump2016', '#Hilary2016', '#Rand2016', '#Jeb2016', '#Christie2016', '#FeelTheBern',
			'#Cruz2016', '#Biden2016', '#Fiorina2016', '#PresidentialElection', '#DemDebate'
		]

		@tweets = []

		sample_size = 100 / @hash_tags.length

		client = Twitter::REST::Client.new do |config|
		  config.consumer_key       = 'hvWaAIoUXTseFppzXYqqp3dXm'
		  config.consumer_secret    = 'mTRw5vCSlm23WHnRLEzyjQDoaOKjAKLNLk9H7I1DuTdDGe6jUJ'
		  config.access_token        = '1024940624-X5yzRS7ODH6K4ZfLKWAe1VNHhjzOzEc0FROMTx7'
		  config.access_token_secret = 'GpXkul8flPI16egRoYkyqlKQJzW6R9K63Nc1xKtcjjRrh'
		end

		for tag in @hash_tags
			query = tag + " -rt"
			client.search(query, result_type: "mixed", lang: "en").take(sample_size).collect do |tweet|
				@tweets.push(tweet);
			end
		end
	end
end
