Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :chefs, only: [:index, :show] do
    resources :dishes, only: [:show] do
      resources :ingredients, only: :create
    end
    resources :ingredients, only: :show
    
  end
end
