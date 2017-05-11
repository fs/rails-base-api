module Devise
  module Strategies
    class JsonWebToken < Base
      def valid?
        request.headers["Authorization"].present?
      end

      def authenticate!
        return fail! unless claims
        return fail! unless claims.key? "user_id"

        user = User.find_by(id: claims["user_id"])
        success!(user)
      end

      private

      def claims
        strategy, token = request.headers["Authorization"].split(" ")
        return nil unless (strategy || "").casecmp("bearer")

        ::JWTWrapper.decode(token)
      end
    end
  end
end
