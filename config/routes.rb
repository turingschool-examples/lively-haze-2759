Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post 'dishes/:id', to: 'dishes#add_ingredient', as: :add_ingredient_to_dish

  resources :dishes, only: [:show]
  resources :chefs, only: [:show]
  namespace :chefs do
    resources :ingredients, only: [:index]
  end

end
