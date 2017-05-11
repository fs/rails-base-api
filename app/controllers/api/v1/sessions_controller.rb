module Api
  module V1
    class SessionsController < ApplicationController
      delegate :user, to: :authentication

      def create
        if authentication.success?
          sign_in :user, user
          token = GenerateToken.call(user: user).token
          render json: token, status: :created
        else
          head :unauthorized
        end
      end

      private

      def session_params
        params.require(:session).permit(:email, :password)
      end

      def authentication
        @_result ||= Auth.call(session_params)
      end
    end
  end
end
