class DishesController < ApplicationController
  def show
    @dish = Dish.find(params[:id])
    @ingredient = Ingredient.new
  end
  def add_ingredient
    @dish = Dish.find(params[:id])
    @ingredient = Ingredient.find(params[:ingredient_id])
    @dish.ingredients << @ingredient

    redirect_to @dish, notice: 'Ingredient added to the dish successfully.'
  end
end