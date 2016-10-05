module V1
  class SessionResource < V1::ApplicationResource
    model_name "User"
    attributes :authentication_token, :email, :password
  end
end
