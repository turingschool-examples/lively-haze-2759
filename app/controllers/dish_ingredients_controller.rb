class DishIngredientsController < ApplicationController
  def create
    @dish = Dish.find(params[:dish_id])
    result = @dish.add_ingredient(params[:ingredient_id])
    flash[result[:success] ? :notice : :alert] = result[:message]
    redirect_to dish_path(@dish)
  end
end
