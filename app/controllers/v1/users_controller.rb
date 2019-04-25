module V1
  class UsersController < V1::BaseController
    expose :user
    expose :users, -> { User.all }

    def index
      respond_with users
    end

    def show
      respond_with user, location: :v1_user
    end
  end
end
