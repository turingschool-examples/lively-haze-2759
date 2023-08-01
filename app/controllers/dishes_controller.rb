class DishesController < ApplicationController
  
  def show
    @dishes = Dish.find(params[:id])  
  end

  def add_ingredient
    dish = Dish.find(params[:id])
    ingredient_id = params[:dish][:ingredient_id]
    dish.add_ingredient(ingredient_id)
    redirect_to dish_path(dish)
  end
  
  private
  def new_ingredient
    params.require(:dish).permit(:ingredient_id)
  end
end