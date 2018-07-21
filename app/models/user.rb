class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :ratings
  has_many :orders
  has_many :feedbacks
  has_many :carts

  validates :name, presence: true,
    length: {maximum: Settings.user.name.maximum}
  validates :email, presence: true,
    length: {maximum: Settings.user.email.maximum},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, presence: true,
    length: {minimum: Settings.user.password.minimum},
    allow_nil: true

  has_secure_password
  before_save :downcase_email

  private

  def downcase_email
    email.downcase!
  end

  class << self
    def digest string
      BCrypt::Password.create string, cost: 4
    end
  end
end
