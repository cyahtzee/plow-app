Rails.application.routes.draw do
  namespace :owner do
    get 'items/index'
  end
  namespace :owner do
    get 'bookings/index'
  end
  devise_for :users
  root to: 'items#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :items, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:index, :update]
  namespace :owner do
    resources :bookings, only: [:index]
    resources :items, only: [:index]
  end
end
