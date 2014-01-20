class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :validatable

  before_save :ensure_authentication_token!

  has_many :comments

  def ensure_authentication_token!
    self.authentication_token = generate_authentication_token if authentication_token.blank?
  end

  private

  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
  end
end
