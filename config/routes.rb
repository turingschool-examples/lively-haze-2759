Rails.application.routes.draw do
  get "/dishes/:id", to: "dishes#index"
  patch "/dishes/:id", to: "dishes#update"
  get "/chefs/:id", to: "chefs#show"
  get "/chefs/:id/ingredients", to: "chefs_ingredients#index"
end
