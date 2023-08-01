class IngredientsController < ApplicationController
    def index
        @chef = Chef.find(params[:chef_id])
        @dishes = @chef.dishes
        @ingredients = @dishes.select('ingredients.name').joins(:ingredients).distinct
    end
end