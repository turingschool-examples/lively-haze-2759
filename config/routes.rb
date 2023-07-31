Rails.application.routes.draw do
  resources :dishes, only: [:show, :update]
  resources :chefs, only: :show
end
