Rails.application.routes.draw do

  resources :dishes, only: [:show, :update]

  resources :chefs, only: [:show] do
    resources :ingredients, only: [:index], controller: "chefs/ingredients"
  end
  
end

