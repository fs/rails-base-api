module V1
  class ProfilesController < V1::BaseController
    def show
      respond_with_resource(current_user, location: :v1_profile)
    end

    def update
      if current_user.update(user_params)
        respond_with_resource(current_user, status: :ok, location: :v1_profile)
      else
        respond_with_resource_errors(current_user)
      end
    end

    def destroy
      current_user.destroy
      respond_with_resource(current_user, location: nil)
    end

    private

    def user_params
      jsonapi_params(only: %i[full_name email password])
    end
  end
end
