class DishesController < ApplicationController
  
  def show
    # @dish = Dish.all
    @dishes = Dish.find(params[:id])  
  end
end