Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    post 'login', to: 'devise/sessions#create'

    get  'signup' => 'devise/registrations#new'
    post 'signup' => 'devise/registrations#create'

    get '/signout', to: 'devise/sessions#destroy', as: :signout
  end

  # get    '/auth/facebook/callback' => 'sessions#create'

  # get    '/signup' => 'users#new'
  # post   '/signup' => 'users#create'

  # get    '/login'  => 'sessions#new'
  # post   '/login'  => 'sessions#create'
  # delete '/logout' => 'sessions#destroy'

  # root '/users/show'
  resources :users,    only: :show
  # resources :sessions, only: [:new, :create, :destroy]
end
