Rails.application.routes.draw do
  root to: 'home#index'
  patch 'capture', to:'pokemons#capture'
  patch 'damage', to:'trainers#damage'
  patch 'newp', to:'pokemons#new'
  # patch 'capture', to:'pokemons#capture'
  devise_for :trainers
  resources :trainers
  resources :pokemons
end
