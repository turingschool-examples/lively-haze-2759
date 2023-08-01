class DishIngredientsController < ApplicationController

  def create
    di = DishIngredient.new(dish_id: params[:dish_id], ingredient_id: params[:ingredient_id])
    di.save

    redirect_to dish_path(params[:dish_id])
   end
end