Rails.application.routes.draw do
  resources :dishes, only: [:show, :update]
  resources :chefs, only: [:show, :index] #I don't know how to route to a chef's ingredients index page???!?!?!
end
