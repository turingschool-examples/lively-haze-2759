class DishController < ApplicationController
  def show
    @dish = Dish.find(params[:id])
    @ingredients = @dish.ingredients
    @chef = @dish.chef
  end

  def update
    dish = Dish.find(dish_params[:id])
    dish.ingredients << Ingredient.find(dish_params[:dish][:id])
    redirect_to dish_path(dish)
  end

  private

  def dish_params
    params.permit(:id, dish: :id)
  end
end
