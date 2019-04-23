module V1
  class TokensController < V1::BaseController
    skip_before_action :authenticate_user!

    def create
      result = CreateJwt.call(authentication_params)

      if result.success?
        render json: { token: result.token }, status: :created
      else
        render json: { error: result.message }, status: result.code
      end
    end

    private

    def authentication_params
      params.require(:authorization).permit(:email, :password)
    end
  end
end
