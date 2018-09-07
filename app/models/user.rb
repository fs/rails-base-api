class User < ActiveRecord::Base
  has_secure_password

  # acts_as_token_authenticatable

  # devise :database_authenticatable, :registerable,
  #   :recoverable, :trackable, :validatable
end
