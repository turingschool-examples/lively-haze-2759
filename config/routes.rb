Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  #resources :dishes
  get "/dishes/:id", to: "dishes#show"
  post "/dishes/:id", to: "dishes#create"

  #get "/chefs/:id", to: "chefs#show"
  #get "/chefs", to: "chef_ingredients#index"

  resources :chefs, only: [:show] do
    resources :chef_ingredients, only: [:index], as: 'ingredients'
  end
end
