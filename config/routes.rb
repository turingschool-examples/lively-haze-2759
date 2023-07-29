Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :chefs, only: [:show] do
    resources :ingredients, only: [:index], controller: "chefs/ingredients"
  end

  resources :dishes, only: [:show, :update] 
end
