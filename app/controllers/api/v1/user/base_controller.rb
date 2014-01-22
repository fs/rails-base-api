module Api
  module V1
    class User::BaseController < ApplicationController
      before_filter :authenticate_user!
    end
  end
end
