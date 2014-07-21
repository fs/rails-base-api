Rails.application.routes.draw do
  scope defaults: { format: :json } do
    devise_for :users, only: []
    devise_scope :user do
      post 'users/sign_in', to: 'sessions#create'
    end
  end
end
