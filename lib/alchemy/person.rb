class Person 
	def initialize(name, firstName, lastName, twitterHandle, tags)
		class << self; 
			attr_accessor :name, 
				:firstName,
				:lastName,
				:twitterHandle, 
				:tags, 
				:positiveSentiment, 
				:negativeSentiment 
		end
		@name = name
		@firstName = firstName
		@lastName = lastName
		@twitterHandle = twitterHandle
		@tags = [tags]
	end
end
