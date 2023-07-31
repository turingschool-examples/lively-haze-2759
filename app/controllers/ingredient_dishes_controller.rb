class IngredientDishesController < ApplicationController
  def create
    IngredientDish.create(dish_id: params[:dish_id], ingredient_id: params[:ingredient_id])
    redirect_to "/dishes/#{params[:dish_id]}"
  end
end