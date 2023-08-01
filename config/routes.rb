Rails.application.routes.draw do
  resources :chefs, only: [:show] do
    member do
      get 'ingredients_index'
    end
  end

  resources :dishes, only: [:show] do
    member do
      post 'create_dish_ingredient'
    end
  end
end
