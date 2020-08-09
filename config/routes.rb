Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:show,:create]
  
  resources :places, only: [:index, :show, :create, :edit, :destroy, :update] do
   resources :things
 end
 
 get "user_things", to: "things#user_things"
end
