Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :ingredients, only: [:index]
  resources :dish, only: [:show, :update] 
  resources :chef, only: [:show] do
    member do
      get 'ingredients', to: 'ingredient#index' 
      # hey I originally used an ingredient controller method in a chef controller route, 
      # but using ingredient#index seemed more railsy but i could be wrong
    end
  end
end
