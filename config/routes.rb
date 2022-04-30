Rails.application.routes.draw do
  resources :books, only: [:index, :show]
  resources :sections, only: :show
  resources :reviews, only: %i[index create] do
    collection do
      delete :destroy_multiple
    end
  end
end
