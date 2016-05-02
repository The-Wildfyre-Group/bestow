Rails.application.routes.draw do
  root 'main#index'

  #auth block
  scope module: :auth do
    resources :sessions, only: [:new, :create, :destroy]
    resources :registrations, only: [:new, :create]
  end
  get '/login', to: 'auth/sessions#new', as: :login
  delete '/logout', to: 'auth/sessions#destroy', as: :logout
  get '/signup', to: 'auth/registrations#new', as: :signup
end
