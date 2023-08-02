class ChefsController < ApplicationController

  def show
    @chef = Chef.find(params[:id])

    # @popular_ingredients = @chef.ingredients.order(dish_count: :desc).limit(3)
  end
  
end