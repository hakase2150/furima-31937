Rails.application.routes.draw do
  devise_for :users

  resources :items, only: [:index, :new, :show, :create]
  root to: "items#index"
end