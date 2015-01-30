class Author < ActiveRecord::Base
  self.table_name = :users
  has_many :comments
  has_many :posts
  has_many :tags, :through => :posts
  belongs_to :image

  validates :name, {presence: true, length: { minimum: 11 }}
  validates :email, confirmation: true
  validate :email_is_valid
  validate :twitter_starts_with_at

  def twitter_starts_with_at
    unless twitter.starts_with? "@"
      errors.add(:twitter, "invalid format")
    end
  end

  def email_is_valid
    unless (email.include? "@") && (email.include? ".")
      errors.add(:email, "invalid email")
    end
  end

end