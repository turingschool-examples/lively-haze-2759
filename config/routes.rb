Rails.application.routes.draw do
  resources :dishes, only: [:show]
  resources :dish_ingredients, only: [:create]


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
