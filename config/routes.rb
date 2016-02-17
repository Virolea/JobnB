Rails.application.routes.draw do
  get 'omniauth_callbacks_controller/facebook'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :posts, only: [:index, :show, :new, :create, :delete] do
    resources :missions, only: [:new, :create]
  end

  root to: 'pages#home'

  get 'dashboard', to: 'pages#dashboard'
end
