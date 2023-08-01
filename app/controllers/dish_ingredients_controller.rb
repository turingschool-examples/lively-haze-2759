class DishIngredientsController < ApplicationController
  def create
    @dish_ingredient = DishIngredient.create(dish_id: params[:dish_id], ingredient_id: params[:ingredient_id])
    redirect_to dish_path(@dish_ingredient.dish_id)
  end
end