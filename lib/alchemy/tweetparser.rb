class TweetParser
	require './alchemyapi'
	require './candidate.rb'

	@text = "bernie sanders is some guy"
	@text.downcase!
	@gaveSentiment = false 

	bern = Candidate.new("Bernie Sanders","@berniesanders",["#feelthebern","#bernie2016"])
	trump  = Candidate.new("Donald Trump","@donaldtrump",
			       ["#makeamericagreatagain","#trump2016"])
	clinton  = Candidate.new("Hillary Clinton","@hillaryclinton",
				 ["#imwithher","#hillary2016"])
	@candidates = [bern, trump, clinton]

	def findCandidate()
		@candidates.each {
			|cand|
			cand.name = cand.name.downcase!
			if (@text[cand.name] || @text[cand.twitterHandle])
				puts cand.name
				assumeSentiment(cand)
			end
		}

	end

	def assumeSentiment(cand)
		cand.tags[0].each {
			|tag|
			if(@text[tag])
				@gaveSentiment = true 
				cand.positiveSentiment += 1
				puts "Gave #{cand.name} +#{cand.positiveSentiment}" 
				return 1

			end

		}
		#No luck gotta pass to Alchemy :(
		passToAlchemy(@text)
	end

	def passToAlchemy(text)
		alchemyapi = AlchemyAPI.new()
		if (@gaveSentiment == false || @gaveSentiment == false && chosenCandidate != "")
			response = alchemyapi.entities('text', text, { 'sentiment'=>1 })
			puts response['entities']
			puts ' '
			puts ' '
			if response['status'] = 'OK'
				for entity in response['entities']
					if entity['type'] == 'Person'
						puts entity['text']
						puts entity['sentiment']['type']

					end
=begin
		if entity['type'] == 'Hashtag'
		puts entity['text']
end
if entity['type'] == 'TwitterHandle'
puts entity['text']
end
=end
				end
			end
		end
	end
	findCandidate
end
