class DishIngredientsController < ApplicationController

    def create
        @dish = Dish.find(dish_ingredient_params[:dish_id])
        @chef = @dish.chef
        DishIngredient.create(dish_ingredient_params)
        redirect_to chef_dish_path(@chef.id, @dish.id)
    end

    private

    def dish_ingredient_params
        params.permit(:ingredient_id, :dish_id)
    end
end