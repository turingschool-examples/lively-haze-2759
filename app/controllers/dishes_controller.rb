class DishesController < ApplicationController
  def show
    @dish = Dish.find(params[:id])
  end

  # def update
  #   @dish = Dish.find(params[:id])
  #   if @dish.update(dish_params)
  # end

  # private

  # def dish_params
  #   params.require(:dish).permit(:)
  # end
end