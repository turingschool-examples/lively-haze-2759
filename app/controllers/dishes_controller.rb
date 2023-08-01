class DishesController < ApplicationController

  def show
    @dish = Dish.find(params[:id])
  end

  def update
    dish = Dish.find(params[:id])
    DishIngredient.create!(dish: dish, ingredient_id: params[:dish][:add_ingredient])
    redirect_to dish_path(dish)
  end
  
end