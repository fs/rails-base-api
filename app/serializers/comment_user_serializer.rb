class CommentUserSerializer < ApplicationSerializer
  attributes :id, :authentication_token, :email
end
