Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resource :dishes, only: [:show, :update]
  resource :dish_ingredients, only: [:create, :destroy]
  resource :chefs, only: [:show] do
    resource :ingredients, only: [:index], controller: "chefs/ingredients"
  end
end
