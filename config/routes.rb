Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  devise_scope :user do
    get  'login', to: 'devise/sessions#new'
    post 'login', to: 'devise/sessions#create'

    get  'signup' => 'devise/registrations#new'
    post 'signup' => 'devise/registrations#create'

    get '/signout', to: 'devise/sessions#destroy', as: :signout

    root 'devise/registrations#new'
  end

  resources :users,    only: [:show, :index]
  resources :posts
  resources :comments
  resources :likes
end
