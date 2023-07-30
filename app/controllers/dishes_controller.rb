class DishesController < ApplicationController
  def show
    @dish_indiv = Dish.find(params[:id])
    @total_calories = @dish_indiv.calorie_count
  end

  def create
    #require 'pry'; binding.pry
    @ingredient = Ingredient.new(ingredient_params)
    
    @ingredient.save

    redirect_to "/dishes/#{params[:id].to_i}"
  end

  def ingredient_params
    params.permit(:name, :calories)
  end
end