Rails.application.routes.draw do


  resources :sessions, only: [:new, :create, :destroy]
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  resources :users do
    resources :articles do
    resources :comments
    end
    member do
      get :confirm_email
    end
  end
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  root 'homes#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
