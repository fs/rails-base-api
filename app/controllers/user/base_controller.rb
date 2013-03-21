class User::BaseController < ApplicationController
  before_filter :authenticate_user!
end
