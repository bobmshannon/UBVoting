class Video
  include Mongoid::Document
  field :title
  field :url
  field :embed_url
  field :desc
  field :youtube_id
  embedded_in :candidate
end