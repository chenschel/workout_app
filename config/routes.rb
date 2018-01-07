Rails.application.routes.draw do
  get 'friendships/show'

  get 'friendships/create'

  get 'friendships/destroy'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  get 'dashboard/index'

  resources :users do
    resources :exercises
  end

  resource :dashboard, only: [:index] do
    collection do
      post :search, to: 'dashboard#search'
    end
  end

  resources :friendships, only: [:show, :create, :destroy]

  root to: 'dashboard#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
