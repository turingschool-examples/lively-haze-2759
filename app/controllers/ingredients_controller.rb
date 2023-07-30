class IngredientsController < ApplicationController
  def index
    @chef = Chef.find(params[:chef_id])
    @ingredient_names = @chef.ingredient_names
  end
end