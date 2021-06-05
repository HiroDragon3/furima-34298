Rails.application.routes.draw do
  devise_for :users
  #root 'items#index'
  root to: 'items#index'
  resources :items, only: :index
end
