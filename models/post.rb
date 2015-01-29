class Post < ActiveRecord::Base
  has_one :author
  has_many :comments
  has_many :images
  has_many :post_tags
  has_many :tags, :through => :post_tags
end