Rails.application.routes.draw do
  resources :tags
  resources :schedules
  resources :areas
  resources :comments
  resources :contracts
  resources :posts
  resources :flows
  resources :social_accounts
  resources :categories
  resources :creator_exts
  resources :metrics
  resources :creator_metrics
  resources :services
  resources :users
  resources :campaigns
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
