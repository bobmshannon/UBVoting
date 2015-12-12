class Photo
  include Mongoid::Document
  field :url
  field :caption
  field :type
  embedded_in :candidate
end
