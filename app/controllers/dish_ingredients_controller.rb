class DishIngredientsController < ApplicationController
  def new
    @dish_ingredient = DishIngredient.new(dish: Dish.find(params[:dish_id]))
  end

  def create
    dish_id = params[:dish_id]
    ingredient_id = params[:ingredient_id]

    dish_ingredient = DishIngredient.new(dish_id: dish_id, ingredient_id: ingredient_id)
    dish_ingredient.save

    redirect_to dish_path(dish_ingredient.dish_id)
    flash[:success] = 'Ingredient added successfully'
  end
end