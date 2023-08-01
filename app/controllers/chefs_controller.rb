class ChefsController < ApplicationController
  def show
    @chef = Chef.find(params[:id])
  end

  def index
    @ingredients = DishIngredient.find(params[:ingredient_id])
  end
end