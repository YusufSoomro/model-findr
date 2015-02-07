class User < ActiveRecord::Base
  attr_reader :password

  after_initialize :ensure_session_token

  validates :email, :username, :password_digest, :session_token, uniqueness: true, presence: true
  validates :password, length: { minimum: 6, allow_nil: true}
  validates :skill_type, inclusion: { in: ["Photographer", "Model"] }
  validates :gender, inclusion: { in: ["Male", "Female"] }

  has_many :user_views

  has_many :images

  has_many :image_likes, foreign_key: :liker_id

  has_many :liked_images, through: :image_likes, source: :image

  def self.find_by_credentials(email, password)
    user = User.find_by_email(email)

    user && user.is_password?(password) ? user : nil
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password).to_s
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_session_token!
    self.session_token = generate_unique_token
    self.save!
    self.session_token
  end

  def generate_unique_token
    pass_digest = SecureRandom.urlsafe_base64

    while User.exists?(session_token: pass_digest)
      pass_digest = SecureRandom.urlsafe_base64
    end

    pass_digest
  end

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64
  end
end
