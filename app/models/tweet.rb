class Tweet
  include Mongoid::Document
  include Geocoder::Model::Mongoid
  # Unique ID for the tweet
  field :id, type: String
  # User name of tweet author
  field :screen_name, type: String
  # Time and date when the tweet was sent
  field :created_at, type: String
  # Tweet text
  field :text, type: String
  # Number of times tweet was favorited
  field :favorite_count, type: Integer
  # Number of times tweet was retweeted
  field :retweet_count, type: Integer
  # The language of the tweet
  field :lang, type: String
  # Type of device tweet was sent from
  field :source, type: String
  # User's screen name
  field :screen_name, type: String
  # Allowed time to tweet for user
  field :time, type: Integer  
  # The location information where the tweet was sent from (if available) 
  field :coordinates, type: Array
  field :location, type: Hash
  # Reverse geocode coordinates and update location hash when model is saved
  reverse_geocoded_by :coordinates do |obj,results|
    if geo = results.first
      obj.location = {
        :address => geo.address,
        :city => geo.city,
        :state => geo.state,
        :country => geo.country,
        :country_code => geo.country_code,
        :lat => geo.latitude,
        :lng => geo.longitude
      }
    end
  end
  after_validation :reverse_geocode
end
