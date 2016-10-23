module V1
  class UserResource < V1::ApplicationResource
    attributes :email, :password
    has_many :todo_items

    def fetchable_resources
      super - [:password]
    end
  end
end
