module V1
  class TokensController < V1::BaseController
    skip_before_action :authenticate_user!

    def create
      result = CreateJwt.call(authentication_params)

      if result.success?
        respond_with_resource(result.jwt_token, status: :created, location: nil)
      else
        respond_with_error(result.code)
      end
    end

    private

    def authentication_params
      jsonapi_params(only: %i[email password])
    end
  end
end
