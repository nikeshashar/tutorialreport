require 'elasticsearch/model'

class Tutorial < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  index_name [Rails.env, model_name.collection.gsub(/\//, '-')].join('_')
end
# Tutorial.import
