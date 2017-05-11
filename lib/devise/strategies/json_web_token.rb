module Devise
  module Strategies
    class JsonWebToken < Base
      def valid?
        request.headers["Authorization"].present?
      end

      def authenticate!
        return fail! unless claims
        return fail! unless claims.key? :sub

        if user = User.find_by(id: claims[:sub])
          success!(user)
        else
          fail!
        end
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
