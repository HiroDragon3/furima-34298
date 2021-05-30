Rails.application.routes.draw do
  root 'items#index'
  #root to: 'items#index'
  resources :items, only: :index
end
