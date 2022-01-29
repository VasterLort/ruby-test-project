require 'elasticsearch/model'

class Post < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  
  settings index: { number_of_shards: 1 } 
  belongs_to :user
  searchkick word_middle: [:title, :description]
  validates :title, presence: true, length: { minimum: 3, miaximum: 50 }
  validates :description, presence: true, length:  { minimum: 10, miaximum: 250 }

  Elasticsearch::Model.client = Elasticsearch::Client.new url: ENV['BONSAI_URL'], log: true
end
