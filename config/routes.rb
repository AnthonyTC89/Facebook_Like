Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get    '/auth/facebook/callback' => 'sessions#create'

  get    '/signup' => 'users#new'
  post   '/signup' => 'users#create'

  # get    '/login'  => 'sessions#new'
  # post   '/login'  => 'sessions#create'
  # delete '/logout' => 'sessions#destroy'

  resources :users,    only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
end
