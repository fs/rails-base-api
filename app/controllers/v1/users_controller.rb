module V1
  class UsersController < V1::BaseController
    skip_before_action :authenticate_user

    expose :user

    def create
      if user.save
        respond_with_resource(user, status: :created, location: nil)
      else
        respond_with_resource_errors(user)
      end
    end

    private

    def user_params
      jsonapi_params(only: %i[email password])
    end
  end
end
