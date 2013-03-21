class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :validatable,
         :token_authenticatable

  before_save :ensure_authentication_token

  has_many :comments
end
