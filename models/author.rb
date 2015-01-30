class Author < ActiveRecord::Base
  self.table_name = :users
  has_many :comments
  has_many :posts
  has_many :tags, :through => :posts
  belongs_to :image

  
  
end