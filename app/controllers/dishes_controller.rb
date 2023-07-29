class DishesController < ApplicationController
  def show
    @dish = Dish.find(params[:id])
  end

  def edit
    @dish = Dish.find(params[:id])
  end

  def update
    dish = Dish.find(params[:id])
    ingredient = Ingredient.find(params[:dish][:add_ingredient_id])
    dish.ingredients.push(ingredient)
    redirect_to dish_path(dish.id)
  end
end