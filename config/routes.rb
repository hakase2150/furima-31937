Rails.application.routes.draw do
<<<<<<< Updated upstream
=======
  resources :items, only: :index
>>>>>>> Stashed changes
  root to: "items#index"
end