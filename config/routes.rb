Rails.application.routes.draw do
  devise_for :users

  resources :items do
    resources :buyers, only: [:index, :create]
  end
  
  root to: "items#index"
end