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
				puts ' '
				puts '/\/\/\/\/\NEW TWEET/\/\/\/\/ '
				puts 'from #{@state}'
				puts '++++++++'
				puts @text
				puts '++++++++'
				puts ' '
				if(@state != NIL)
					initializeCandidates()
					findCandidate()
				end
			end
		end
	end

	#Initialize some candidates so they are saved locally and I can hopefully save some calls to the DB
	def initializeCandidates()
		@sanders = Person.new("Bernie Sanders","@berniesanders",["#feelthebern","#bernie2016",
							   "#berniesanders2016","#sanders2016"])
		@trump  = Person.new("Donald Trump","@donaldtrump",["#makeamericagreatagain","#trump2016",
						      "#donaldtrump2016","#donald2016"])
		@clinton  = Person.new("Hillary Clinton","@hillaryclinton",["#imwithher","#hillary2016",
							      "#hillaryclinton2016","#clinton2016"])
		@rubio = Person.new("Marco Rubio","@marcorubio",["#teamrubio","#rubio2016",
						   "#marco2016","#marcorubio2016"])
		@omalley  = Person.new("Martin O'Malley","@martinomalley",['#martinomalley2016','#martin2016',
							     '#omalley2016','#mom2016'])
		@cruz  = Person.new("Ted Cruz","@tedcruz",['#tedcruz2016','#ted2016','#cruz2016','#cruzcrew'])
		@bush  = Person.new("Jeb Bush","@jebbush",['#jebbush2016','#jeb2016','#bush2016','#jebcanfixit'])
		@carson  = Person.new("Ben Carson","@realbencarson",['#bencarson2016','#ben2016',
						       '#carson2016','#imwithben'])
		@candidates = [@sanders, @trump, @clinton, @rubio,@omalley,@cruz, @bush, @carson]
	end

	#Trys to find the candidate in a "brute force" easy way 
	#Looking for the candidates name,twitterhandle or hashtags, save some calls to alchemy
	#If a candidate is found it will pass check for hashtags relating to that candidate
	def findCandidate()
		@candidates.each {
			|cand|
			if (@text[cand.name] || @text[cand.name.downcase] || @text[cand.twitterHandle] || @text['#'] )
				checkCandidateTags(cand)
			end
		}
		#No luck on assuming candidate/sentiment gotta pass to Alchemy :( 
		if(@chosenCandidate == NIL)
			determineEntities(@text)
		end
	end

	def checkCandidateTags(cand)
		cand.tags[0].each {
			|tag|
			if(@text[tag])
				@chosenCandidate = Candidate.find_by(full_name: cand.name)
				setSentiment('positive')
				return true
			end
		}
		return false
	rescue Mongoid::Errors::DocumentNotFound
		return false
	end


	#Parses out the entities in the text
	#if it's a person than it will pass the entity to determineCandidate
	#Once the candidate is found it determines the sentiment
	def determineEntities(text)
		puts 'Entered Alchemy!!'
		alchemyapi = AlchemyAPI.new()
		response = alchemyapi.entities('text', text, { 'sentiment'=>1 })
		if response['status'] = 'OK'
			for entity in response['entities']
				if entity['type'] == 'Person'
					if( setChosenCandidate(entity)== true)
						determineSentimentPolarity(entity)
					end
				end
				if entity['type'] == 'Hashtag'
					#	puts entity['text']
				end
				if entity['type'] == 'TwitterHandle'
					#	puts entity['text']
				end
			end
		end
	end

	#sets the chosenCandidate if they are found in the text of the entity
	def setChosenCandidate(entity)
		@chosenCandidate = Candidate.find_by(full_name_lower: entity['text'])
		return true
	rescue Mongoid::Errors::DocumentNotFound
		return false
	end


	#Just figures out if the text is positive or negative towards the candidate
	#Sets the sentiment accordinly
	def determineSentimentPolarity(entity)
		if(entity['sentiment']['type'] == 'positive')
			setSentiment('positive')
		end

		if(entity['sentiment']['type'] == 'negative')
			setSentiment('negative')
		end
	end 

	def setSentiment(sentiment)
		if(@chosenCandidate != NIL)
			if(sentiment == 'positive')
				@chosenCandidate.states.find_by(name: @state).positiveSentiment += 1
				puts ' '
				puts '+++++++'
				puts "Positive sentiment towards #{@chosenCandidate.full_name} + #{@chosenCandidate.states.find_by(name:@state).positiveSentiment} from #{@state}"
				puts '+++++++'
				puts ' '

			end

			if(sentiment == 'negative')
				@chosenCandidate.states.find_by(name: @state).negativeSentiment += 1
				puts ' '
				puts '+++++++'
				puts "Negative sentiment towards #{@chosenCandidate.full_name} - #{@chosenCandidate.states.find_by(name:@state).negativeSentiment} from #{@state} "
				puts '+++++++'
				puts ' '
			end
		end

	rescue Mongoid::Errors::DocumentNotFound
		return false
	end
end
