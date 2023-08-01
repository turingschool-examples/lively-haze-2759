Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'welcome#index'

  resources :chefs, only: %i[index show] do
    resources :ingredients, only: [:index], module: :chefs
  end

  resources :dishes, only: %i[index show] do
    resources :dish_ingredients, only: [:create]
  end
end
