#!/usr/bin/env ruby
require File.expand_path('../../../config/environment', __FILE__)

require './alchemyapi'
require './person.rb'

class TweetParser
	def initialize()
		begin
			@text = "Bernie sanders is good but not realistic.  Donald trump will sell america. Hillary clinton is satan in the flesh.  and this is just some string testing everything"
			@text.downcase!
			@gaveSentiment = false 
			initializeCandidates()
			@candidates = [@sanders, @trump, @clinton, @rubio, 
		  @omalley,@cruz, @bush, @carson]
			findCandidate()
		end
	end

	#Save some calls to the database
	#Should be much faster as it's only the data I immediatley need
	def initializeCandidates()
		@sanders = Person.new("Bernie Sanders","@berniesanders",
				      ["#feelthebern","#bernie2016"])
		@trump  = Person.new("Donald Trump","@donaldtrump",
				     ["#makeamericagreatagain","#trump2016"])
		@clinton  = Person.new("Hillary Clinton","@hillaryclinton",
				       ["#imwithher","#hillary2016"])
		@rubio = Person.new("Marco Rubio","@marcorubio",
				    ["#teamrubio","#rubio2016"])
		@omalley  = Person.new("Martin O'Malley","@martinomalley",
				       ["#mom2016","#omalley2016"])
		@cruz  = Person.new("Ted Cruz","@tedcruz",
				    ["#cruzcrew","#cruz2016"])
		@bush  = Person.new("Jeb Bush","@jebbush",
				    ["#","#"])
		@carson  = Person.new("Ben carson","@realbencarson",
				      ["#imwithben","#carson2016"])
	end



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
		if (@gaveSentiment == false || 
		    @gaveSentiment == false && chosenCandidate != "")
			response = alchemyapi.entities('text', text, { 'sentiment'=>1 })
			if response['status'] = 'OK'
				for entity in response['entities']
					#This will be in it's own function
					if entity['type'] == 'Person'
						if(entity['sentiment']['type'] == 'positive')
							foundCandi = Candidate.find_by(full_name_lower: entity['text'])
							foundCandi.states.find_by(name: "Alabama").positiveSentiment += 1
							puts "Found #{foundCandi.full_name}"
							puts "Pos Sentim #{foundCandi.states[0].positiveSentiment}"
							puts " "

						end

						if(entity['sentiment']['type'] == 'negative')
							foundCandi = Candidate.find_by(full_name_lower: entity['text'])
							foundCandi.states.find_by(name: "Ohio").negativeSentiment += 1
							puts "Found #{foundCandi.full_name}"
							puts "Neg Sentim #{foundCandi.states.find_by(name: "Ohio").negativeSentiment}"
							puts " "
						end


					end
					if entity['type'] == 'Hashtag'
						puts entity['text']
					end
					if entity['type'] == 'TwitterHandle'
						puts entity['text']
					end
				end
			end
		end
	end
end
