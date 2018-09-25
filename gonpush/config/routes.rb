Rails.application.routes.draw do
  
  get 'sessions/new'
  resources :tasks
  resources :orders
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
  post 'campaigns/generateOrder'
  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login' , to:'sessions#create'
  delete '/logout' , to: 'sessions#destrory'
  get '/getOrder', to: 'sessions#showOrder'
  post '/updateSchedule', to: 'sessions#updateSchedule'
 

end
