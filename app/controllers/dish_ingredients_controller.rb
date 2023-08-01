class DishIngredientsController < ApplicationController
  
  def create
    @dish = Dish.find(params[:format])
    ingredient = Ingredient.find(params[:ingredient_id])
    DishIngredient.create(dish: @dish, ingredient: ingredient)
    redirect_to dishes_path(@dish)
  end
end