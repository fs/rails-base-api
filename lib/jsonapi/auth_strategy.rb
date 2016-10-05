require "devise/strategies/database_authenticatable"

module JSONAPI
  class AuthStrategy < Devise::Strategies::DatabaseAuthenticatable
    private

    def params_auth_hash
      params.dig(:data, :attributes)
    end
  end
end
