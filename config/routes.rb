RailsBaseApi::Application.routes.draw do
  # Devise
  #
  devise_for :users, only: []
  devise_scope :user do
    post 'users/sign_in', to: 'sessions#create'
  end
end
