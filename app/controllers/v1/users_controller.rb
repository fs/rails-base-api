module V1
  class UsersController < ApplicationController
    expose :user, build_params: :resource_params
    expose :users

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
  end
end
