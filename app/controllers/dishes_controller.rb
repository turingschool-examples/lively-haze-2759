class DishesController < ApplicationController
  def index
    @dish = Dish.find(params[:id])
  end
end