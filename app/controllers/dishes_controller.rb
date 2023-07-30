class DishesController < ApplicationController

   def show
    @dish = Dish.find(params[:id])
    @ingredients = @dish.ingredients
   end

   def update
    @dish = Dish.find(params[:id])
    ingredient = Ingredient.find_by(id: params[:dish][:ingredient_id])

    @dish.ingredients << ingredient

    redirect_to dish_path(@dish)
   end

end