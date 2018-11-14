class User < ApplicationRecord
  validates :username, :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: true, message: "can't be blank"
  validates :password, length: { minimum: 6, allow_nil: true }
  before_validation :ensure_session_token

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    user if BCrypt::Password.new(user.password_digest).is_password?(password)
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64
  end

  def reset_session_token!
    session_token = generate_session_token
    save!
    session_token
  end

  def ensure_session_token
    session_token ||= generate_session_token
  end

  def password=(pw)
    @password = pw
    @password_digest = BCrypt::Password.create(pw)
  end

  private
  attr_reader: password
end
