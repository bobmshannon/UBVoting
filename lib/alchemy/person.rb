class Person 
	def initialize(name, twitterHandle, tags)
		class << self; 
			attr_accessor :name, 
				:twitterHandle, 
				:tags, 
				:positiveSentiment, 
				:negativeSentiment 
		end
		@name = name
		@twitterHandle = twitterHandle
		@tags = [tags]
		@positiveSentiment = 0
		@negativeSentiment = 0
	end
end
