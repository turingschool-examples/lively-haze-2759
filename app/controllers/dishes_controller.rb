class DishesController < ApplicationController
  def index
    @dishes = Dish.all
    render 'index'
  end

  def show
    @dish = Dish.find(params[:id])
  end
end
