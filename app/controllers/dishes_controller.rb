
class DishesController < ApplicationController
    def show
      @dish = Dish.find(params[:id])
      @ingredient = Ingredient.new
    end
  
    def create_dish_ingredient
      @dish = Dish.find(params[:id])
      @ingredient = Dish.create_dish_ingredient(@dish.id, ingredient_params)
  
      if @ingredient
        redirect_to @dish, notice: 'Ingredient was successfully added to the dish.'
      else
        render :show
      end
    end
  
    private
  
    def ingredient_params
      params.require(:ingredient).permit(:name, :calories)
    end
  end
  