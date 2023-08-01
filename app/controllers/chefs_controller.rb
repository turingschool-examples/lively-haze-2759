
    class ChefsController < ApplicationController
        def show
          @chef = Chef.find(params[:id])
          @dish = Dish.find(params[:id])
        end
      
        def ingredients_index
          @chef = Chef.find(params[:id])
          @ingredients = @chef.dishes.map(&:ingredients).flatten.uniq
        end
      end