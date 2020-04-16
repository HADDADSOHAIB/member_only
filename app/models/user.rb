class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: { with: VALID_EMAIL_REGEX, message: 'The email is not valid' }
  has_secure_password
  validates :name, presence: true, length: { maximum: 50 }
  validates :username, presence: true, length: { maximum: 50 }
  validates :password, presence: true,
                       length: { minimum: 6 }
  validates :password_confirmation, presence: true
  has_many :posts

  def create_token
    remember_token = Digest::SHA256.hexdigest(SecureRandom.urlsafe_base64.to_s)
    self.update_attribute('remember_token', remember_token)
    remember_token
  end
end
