class Tweet
  include Mongoid::Document
  # Unique ID for the tweet
  field :id, type: String
  # Time and date when the tweet was sent
  field :created_at, type: String
  # Tweet text
  field :text, type: String
  # Tweet entities (hashtags, stock symbols, urls, user mentions)
  #field :user_mentions, type: Hash
  #field :hashtags, type: Hash
  # Coordinates of author
  #field :coordinates, type: Array
  # Number of times tweet was favorited
  field :favorite_count, type: Integer
  # Number of times tweet was retweeted
  field :retweet_count, type: Integer
  # The language of the tweet
  field :lang, type: String
  # Profile image URL of author
  field :profile_image_url, type: String
  # Followers count of author
  field :followers_count, type: Integer
  # Type of device tweet was sent from
  field :source, type: String
  # URL to tweet on twitter.com
  field :url, type: String
  #User's screen name
  field :screen_name, type: String
  #Allowed time to tweet for user
  field :time, type: Integer 	
end
