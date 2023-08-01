class DishesController < ApplicationController
  def show
    @dish = Dish.find(params[:id])
  end

  def update
    @dish = Dish.find(params[:id])
    ingredient = Ingredient.find_by(id: params[:dish][:ingredient_id])

    if ingredient
      @dish.ingredients << ingredient
      redirect_to dish_path(@dish), notice: "Ingredient added successfully."
    else
      redirect_to dish_path(@dish), alert: "Ingredient not found."
    end
  end

  private

  def dish_params
    params.require(:dish).permit(:name, :description, :ingredient_id)
  end
end