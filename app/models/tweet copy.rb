class RecentTweeter
  include Mongoid::Document
   #User's screen name
  field :screen_name, type: String
  #Allowed time to tweet for user
  field :time, type: Integer  

end
