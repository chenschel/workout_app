Rails.application.routes.draw do
  devise_for :users
  get 'dashboard/index'

  resources :users do
    resources :exercises
  end

  root to: 'dashboard#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
