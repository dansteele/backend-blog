class Author < ActiveRecord::Base
  self.table_name = :users
  has_many :comments
  has_many :posts
  has_many :tags, :through => :posts
  belongs_to :image

  validates :name, {presence: true, length: { minimum: 4 }}
  validates :password, {presence: true, confirmation: true}
  validates :password_confirmation, presence: true
  

  validate :email_is_valid
  validate :twitter_starts_with_at

  def twitter_starts_with_at
    unless twitter.start_with? "@"
      errors.add(:twitter, "invalid format")
    end
  end

  def email_is_valid
    unless (email.include? "@") && (email.include? ".")
      errors.add(:email, "invalid email")
    end
  end

end