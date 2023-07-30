Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'welcome#index'

  resources :chefs, only: %i[index show] do
    resources :ingredients, only: [:index], controller: 'chefs/ingredients'
  end

  resources :dishes, only: %i[index show] do
    resources :ingredients, only: [:create], controller: 'dishes/ingredients'
  end
end
