class Tag < ActiveRecord::Base
  has_many :post_tags
  has_many :posts, :through => :post_tags

  validates :name, presence: true
  validates :name, inclusion: { in: %w(Ruby Rails Databases OOP Patterns),
    message: "%{value} is not a valid tag in the list" }
end