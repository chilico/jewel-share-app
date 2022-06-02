Rails.application.routes.draw do
  # get 'users/show'
  # get 'bookings/new'
  # get 'bookings/create'
  devise_for :users
  root to: "jewels#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root pth route ("/")
  # root "jewel#index"
  resources :jewels, except: %i[index] do
    resources :bookings, only: %i[create]
  end

  resources :bookings, only: %i[index]
  resources :users, only: %i[show]
  # get 'my_bookings', to: 'bookings#my_bookings'
  # get 'profile/:id', to: 'users#profile'
end
