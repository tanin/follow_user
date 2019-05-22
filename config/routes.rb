Rails.application.routes.draw do
  root 'users#index'

  # login
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :users, only: [:index]
end
