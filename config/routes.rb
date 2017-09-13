Rails.application.routes.draw do
  scope defaults: { format: :json } do
    devise_for :users, only: []
  end

  namespace :v1, defaults: { format: "json" } do
    devise_scope :user do
      post "users/sign_in", to: 'sessions#create'
    end

    resources :posts, only: [:index, :show, :create], param: :post_id do
      member do
        resources :comments, only: [:index, :create, :update, :destroy]
      end
    end
  end
end
