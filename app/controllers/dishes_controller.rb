class DishesController < ApplicationController
  def index
    @dish = Dish.find(params[:id])
  end

  def update
    @dish = Dish.find(params[:id])
    @ingredient = Ingredient.find(params[:ingredient_id])
    @dish.ingredients << @ingredient
    @dish.save
    redirect_to "/dishes/#{@dish.id}"
  end
end