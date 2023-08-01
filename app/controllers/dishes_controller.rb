class DishesController < ApplicationController
  
  def show
    @dish = Dish.find(params[:format])
  end
end