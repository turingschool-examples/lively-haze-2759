Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # Routes for dishes
  resources :dishes, only: [:index, :show] do
    resources :dish_ingredients, only: [:create]
  end
end
