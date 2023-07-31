class DishesController < ApplicationController
  def show
    @dish = Dish.find(params[:id])
  end

  def update
    @dish_ingredient = DishIngredient.find(params[:ingredient_id])
    @dish_ingredient.update!(ingredient_id: params[:ingredient_id])
    redirect_to dish_path
  end
end