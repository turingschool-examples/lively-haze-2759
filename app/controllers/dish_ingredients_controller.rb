class DishIngredientsController < ApplicationController
  def create
    DishIngredient.create!(dish_ingredient_params)
    redirect_to dish_path(params[:dish_ingredient][:dish_id])
  end

  private

  def dish_ingredient_params
    params.require(:dish_ingredient).permit(:ingredient_id, :dish_id)
  end
end