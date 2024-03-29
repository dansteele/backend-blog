class Post < ActiveRecord::Base
  belongs_to :author
  has_many :comments
  has_many :images
  has_many :post_tags
  has_many :tags, :through => :post_tags

  validates :title, presence: true
  validate :body_longer_than_5_words

  def body_longer_than_5_words
    split_body = body.split(" ")
    unless split_body.length > 5
      errors.add(:body, "Post is too short.")
    end
  end

end