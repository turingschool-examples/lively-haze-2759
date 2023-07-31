class DishIngredientsController < ApplicationController
  def create
    begin
      dish_ingredient = DishIngredient.new(dish_id: params[:dish_id], ingredient_id: params[:ingredient_id])
      dish_ingredient.save!
      redirect_to dish_path(params[:dish_id])
    rescue StandardError => error
      flash[:alert] = error
      redirect_to dish_path(params[:dish_id])
    end
  end
end