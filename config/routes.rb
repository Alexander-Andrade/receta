Rails.application.routes.draw do
  resources :recipes, only: [:index, :show, :create, :update, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'

  resources :recipes, only: [:index, :show, :create, :update, :destroy]
end
