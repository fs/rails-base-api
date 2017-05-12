module Api
  module V1
    class TokensController < ApplicationController
      include TokenClaims

      before_action :authenticate_user!
      before_action :authenticate_by_refresh_token

      def refresh
        payload = JWTPayload.payload_for(current_user)
        auth_token = JWTWrapper.encode(payload)
        token = Token.new(auth_token)
        render json: token
      end

      private

      def authenticate_by_refresh_token
        return head :unauthorized unless claims[:type] && claims[:type] == ::Token::TYPES[:refresh]
      end
    end
  end
end
