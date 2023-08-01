Rails.application.routes.draw do
  get "/dishes/:id", to: "dishes#index"
  patch "/dishes/:id", to: "dishes#update"
end
