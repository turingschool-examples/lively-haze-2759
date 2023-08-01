class ChefsController < ApplicationController
  def show
    @chef = Chef.find(params[:id])
    @popular_ingredients = @chef.three_most_popular_ingredients
  end
end