Rails.application.routes.draw do
  devise_for :users
  root to: 'flats#index'
  resources :flats do
    resources :reservations, shallow: true #shortcut para sacar show, edit update y destroy de este nest
    collection do
      get 'search', to: "flats#search"
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
