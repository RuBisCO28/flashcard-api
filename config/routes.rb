Rails.application.routes.draw do
  resources :books, only: [:index, :show]
  resources :sections, only: :show
end
