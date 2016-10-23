module V1
  class UsersController < ApplicationController
    expose :user

    acts_as_token_authentication_handler_for User, fallback: :exception,
                                                   only: %i(update destroy)
    before_action :authorize!, only: %i(update destroy)

    private

    def authorize!
      authorize user, :update?
    end
  end
end
