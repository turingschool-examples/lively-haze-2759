class DishesController < ApplicationController
  def show
    @dish = Dish.find(params[:id])
  end

  def update
    @dish_ingredient = DishIngredient.find_by(ingredient_id: params[:ingredient_id])
    @dish_ingredient.update!(ingredient_id: params[:ingredient_id])
    redirect_to dish_path
  end

  # def create
  #   require 'pry'; binding.pry
  #   @new_dish_ingredient = DishIngredient.new({
  #   dish_id: [@dish.id],
  #   ingredient_id: params[:ingredient_id]
  # })
  # end
end