class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
    uniqueness: { case_sensitive: false },
    format: { with: VALID_EMAIL_REGEX, message: "The email is not valid" }
  has_secure_password
  validates :password, presence: true,
    length: { minimum: 6 }
  validates :password_confirmation, presence: true
  has_many :posts
end
