class DishIngredientsController < ApplicationController

  def create
    @dish = Dish.find(params[:id])
    @dish_ingredient = DishIngredient.create(dish_ingredient_params)
    redirect_to chef_dish_path(@dish_ingredient.dish.chef.id, @dish_ingredient.dish.id)
  end

  private

  def dish_ingredient_params
    params.permit(:dish_id, :ingredient_id)
  end
end