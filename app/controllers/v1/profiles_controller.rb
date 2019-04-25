module V1
  class ProfilesController < V1::BaseController
    def show
      respond_with current_user
    end

    def update
      current_user.update(user_params)

      respond_with current_user
    end

    def destroy
      current_user.destroy

      respond_with current_user
    end

    private

    def user_params
      params.require(:user).permit(:full_name, :email, :password)
    end
  end
end
