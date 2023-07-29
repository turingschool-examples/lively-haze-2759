Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :dishes, only: [:show, :edit, :update]

  resources :chefs do
    resources :ingredients, only: [:index], controller: 'chefs_ingredients', as: :ingredients
  end

end
