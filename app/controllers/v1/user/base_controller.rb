module V1
  module User
    class BaseController < ApplicationController
      acts_as_token_authentication_handler_for(::User)
    end
  end
end
