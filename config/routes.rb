Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show,:index,:new,:create]
  resources :venues, only: [:show,:index,:new,:create,:edit,:update]
  resources :towns, only: [:show,:index,:new,:create]
  resources :trashtalks, only: [:show, :index, :new, :create]
  resources :rapbattles, only: [:show,:index,:new,:create]
  resources :sessions, only: [:show,:index,:new,:create]
  get '/', to: 'sessions#home', as: 'home'
  get '/rapbattles', to: 'rapbattles#home', as: 'rapbattles_home'
  delete "/logout", to: "sessions#destroy"
  get "/login", to: "sessions#new"
end
