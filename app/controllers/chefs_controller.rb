class ChefsController < ApplicationController
  def show
    @chef = Chef.find(params[:id])
    @ingredient_names = @chef.ingredient_names
  end
end