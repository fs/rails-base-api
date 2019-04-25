module V1
  class RegistrationsController < V1::BaseController
    skip_before_action :authenticate_user!

    expose :user

    def create
      user.save

      respond_with user, location: :v1_profile
    end

    private

    def user_params
      params.require(:user).permit(:full_name, :email, :password)
    end
  end
end
