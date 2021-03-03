Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount BlogApi::V1::Base => '/api'
  resources :posts
  #get '/posts', to: 'posts#index'
end
