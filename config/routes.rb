Rails.application.routes.draw do
  devise_for :users

  resources :items, only: [:index, :new, :show, :create, :edit, :update]
  root to: "items#index"
end