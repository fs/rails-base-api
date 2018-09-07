module V1
  class UsersController < V1::BaseController
    skip_before_action :authenticate_user, only: :create

    expose :user
    expose :users, -> { User.all }

    def index
      respond_with_resources(users)
    end

    def show
      respond_with_resource(user, location: :v1_user)
    end

    def create
      if user.save
        respond_with_resource(user, status: :created, location: :v1_profile)
      else
        respond_with_resource_errors(user)
      end
    end

    private

    def user_params
      jsonapi_params(only: %i[full_name email password])
    end
  end
end
