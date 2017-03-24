class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 5, maximum: 100 }

  has_secure_password

  enum role: %i(user admin)
end
