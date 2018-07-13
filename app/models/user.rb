class User < ApplicationRecord
  has_many :rattings

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true,
    length: {maximum: Settings.user.length.name_max_length}
  validates :email, presence: true,
    length: {maximum: Settings.user.length.email_max_length},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: { case_sensitive: false }
  validates :password, presence: true,
    length: {minimum: Settings.user.length.password_min_length}

  has_secure_password

  before_save { email_casesensitive }

  private 
  
  def email_casesensitive
    email.downcase!
  end
end
