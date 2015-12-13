#!/usr/bin/env ruby
require File.expand_path('../../../config/environment', __FILE__)

require './alchemyapi'
require './person.rb'

class TweetParser
	def initialize(aTweet)
		begin
			if(aTweet.text != NIL && aTweet.location[:state] != NIL)
				@chosenCandidate
				@candidates
				@tweet = aTweet
				@state = @tweet.location[:state]
				@user = @tweet.screen_name
				@text = @tweet.text
				@text.downcase!
				puts @text
				if(@state != NIL)
					initializeCandidates()
					findCandidate()
				end
			end
		end
	end

	#Initialize some candidates so they are saved locally and I can hopefully save some calls to the DB
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
		@candidates = [@sanders, @trump, @clinton, @rubio,
		 @omalley,@cruz, @bush, @carson]
	end

	#Trys to find the candidate in a "brute force" easy way 
	#Looking for the candidates name or twitterhandle, save some calls to alchemy
	#If a candidate is found it will pass him to assumeSentiment
	def findCandidate()
		@candidates.each {
			|cand|
			if (@text[cand.name] || @text[cand.name.downcase]|| @text[cand.twitterHandle])
				puts cand.name
				assumeSentiment(cand)
			end
		}
	end

	#Gets passed the found candidate and will try to find hashtags
	#if hashtags are found, it will increment the candidates sentiment and gracefully exit the process
	def assumeSentiment(cand)
		cand.tags[0].each {
			|tag|
			if(@text[tag])
				@chosenCandidate = Candidate.find_by(full_name: cand.name)
				@chosenCandidate.states.find_by(name: @state).positiveSentiment += 1
				return 1
			end

		}
		#No luck gotta pass to Alchemy :(
		determineEntities(@text)
	end

	#Parses out the entities in the text
	#if it's a person than it will pass the entity to determineCandidate
	#Once the candidate is found it determines the sentiment
	def determineEntities(text)
		alchemyapi = AlchemyAPI.new()
		response = alchemyapi.entities('text', text, { 'sentiment'=>1 })
		if response['status'] = 'OK'
			for entity in response['entities']
				if entity['type'] == 'Person'
					determineCandidate(entity)
					if(@chosenCandidate != NIL)
						determineSentimentPolarity(entity)
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

	#sets the chosenCandidate if they are found in the text of the entity
	def determineCandidate(entity)
		@chosenCandidate = Candidate.find_by(full_name_lower: entity['text'])
	end


	#Just figures out if the text is positive or negative towards the candidate
	#Sets the sentiment accordinly
	def determineSentimentPolarity(entity)
		if(entity['sentiment']['type'] == 'positive')
			setSentiment(entity,'positive')
		end

		if(entity['sentiment']['type'] == 'negative')
			setSentiment(entity,'negative')
		end
	end 

	def setSentiment(entity,sentiment)
		if(sentiment == 'positive')
			@chosenCandidate.states.find_by(name: @state).positiveSentiment += 1
			puts "Found #{@chosenCandidate.full_name}"
			puts "Pos Sentim #{@chosenCandidate.states.find_by(name:@state).positiveSentiment}"
		end
		if(sentiment == 'negative')
			@chosenCandidate.states.find_by(name: @state).negativeSentiment += 1
			puts "Found #{@chosenCandidate.full_name}"
			puts "negative Sentim #{@chosenCandidate.states.find_by(name:@state).negativeSentiment}"
		end
	end
end
