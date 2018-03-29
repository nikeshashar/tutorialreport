require 'elasticsearch/model'

class Tutorial < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
end
Tutorial.import
