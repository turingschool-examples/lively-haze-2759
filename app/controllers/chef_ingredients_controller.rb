class ChefIngredientsController < ApplicationController
  def index
    @chef = Chef.find(params[:chef_id])

    @chef_ingredients = @chef.ingredient_lister
  end
end