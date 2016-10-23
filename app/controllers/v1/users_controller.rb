module V1
  class UsersController < ApplicationController
    expose :user, build_params: :resource_params
    expose :users, -> { User.all }

    acts_as_token_authentication_handler_for User, fallback: :exception,
                                                   only: %i(update destroy)
    before_action :authorize!, only: %i(update destroy)

    def index
      respond_with users
    end

    def show
      respond_with user
    end

    def create
      user.save
      respond_with user
    end

    def update
      user.update(resource_params)
      respond_with user
    end

    def destroy
      current_user.delete
      respond_with user
    end

    private

    def authorize!
      authorize user, :update?
    end
  end
end
