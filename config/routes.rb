Rails.application.routes.draw do
  scope defaults: { format: :json } do
    devise_for :users, only: []
  end

  scope module: :v1 do
    devise_scope :user do
      jsonapi_resources :sessions, only: :create
    end
  end
end
