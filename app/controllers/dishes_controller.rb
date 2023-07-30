class DishesController < ApplicationController

   def show
    @dishes = Dish.find(params[:id])
   end
   
end