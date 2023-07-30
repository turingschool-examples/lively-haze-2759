class ChefsController < ApplicationController
  def show
    @chef = Chef.find(params[:id])
    @popular_ingredients = @chef.top_3_ingredients
  end
end