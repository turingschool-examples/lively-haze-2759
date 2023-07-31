class DishIngredientsController < ApplicationController
  def create
    @dish = Dish.find(params[:dish_id])
    @ingredient = Ingredient.find(params[:ingredient_id])

    if @dish.ingredients.include?(@ingredient)
      flash[:alert] = 'This ingredient is already included in the dish'
    else
      @dish.ingredients << @ingredient
      flash[:notice] = 'Ingredient added successfully' if @dish.save
    end

    redirect_to dish_path(@dish)
  end
end
