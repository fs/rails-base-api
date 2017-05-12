module Api
  module V1
    class UsersController < ApplicationController
      before_action :authenticate_user!, only: %i[show index update destroy]
      before_action :authorize_user!, only: %i[update destroy]

      expose :user
      expose(:users) { User.find_each }

      def create
        if user.save
          head :created
        else
          respond_with :v1, user
        end
      end

      def show
        render json: user
      end

      def index
        render json: users
      end

      def update
        user.update_attributes(user_params)
        respond_with :v1, user
      end

      def destroy
        user.destroy
        head :no_content
      end

      private

      def user_params
        params.require(:user).permit(:email, :password)
      end

      def authorize_user!
        authorize(user, :manage?)
      end
    end
  end
end
