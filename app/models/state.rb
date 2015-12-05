class State
	include Mongoid::Document
	field :id
	field :name
	field :positiveSentiment
	field :negativeSentiment
	embedded_in :candidate

end