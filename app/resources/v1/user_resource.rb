module V1
  class UserResource < V1::ApplicationResource
    attributes :email, :password

    def fetchable_resources
      super - [:password]
    end
  end
end
