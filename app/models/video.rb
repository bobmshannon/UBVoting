class Video
  include Mongoid::Document
  field :title
  field :url
  field :embed_url
  field :desc
  embedded_in :candidate
end