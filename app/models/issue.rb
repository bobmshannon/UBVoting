class Issue
  include Mongoid::Document
  field :title
  field :desc
  field :fa
  embedded_in :candidate
end
