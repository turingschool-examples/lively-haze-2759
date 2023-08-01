class IngredientsController < ApplicationController
  def show
    @Ingredients = Ingredient.all
  end

 

end