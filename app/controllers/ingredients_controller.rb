class IngredientsController < ApplicationController
  def index
    @chef = Chef.find(params[:chef_id])
    @ingredients = @chef.unique_ingredients_for(@chef.id)
  end
end