class Accomplishment
  include Mongoid::Document
  field :text
  embedded_in :candidate
end
