require 'elasticsearch/model'

class Book < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to :user
  mount_uploader :picture, PictureUploader
  validates_presence_of :title, :author, :user

end
Book.import
