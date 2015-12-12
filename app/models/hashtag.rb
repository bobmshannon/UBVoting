class Hashtag
	include Mongoid::Document
	field :positiveTag
	embedded_in :candidate	
end