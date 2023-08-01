class DishesController < ApplicationController
    def show
        # binding.pry;
        @dish = Dish.find(params[:id])
    end
end