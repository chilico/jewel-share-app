Rails.application.routes.draw do
  devise_for :users
  root to: "jewels#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "jewel#index"
  resources :jewels, except: %i[index] do
    resources :bookings, only: %i[create]
  end
  resources :booking, only: %i[destroy]
end
