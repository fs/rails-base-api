class UserSerializer < ApplicationSerializer
  attributes :id, :authentication_token, :email
end
