require 'rails_helper'

RSpec.describe "chef show page", type: :feature do

  it "displays a link for all ingredients used by chef" do
    chef_1 = Chef.create!(name: "andi")
    chef_2 = Chef.create!(name: "seth")
    chef_3 = Chef.create!(name: "deb")
    dish_1 = chef_1.dishes.create!(name: "gumbo", description: "seafood") 
    dish_2 = chef_2.dishes.create!(name: "bread", description: "flour") 
    dish_3 = chef_3.dishes.create!(name: "cake", description: "flour") 
    ingredient_1 = Ingredient.create!(name: "shrimp", calories: 100) 
    ingredient_2 = Ingredient.create!(name: "sugar", calories: 100) 
    ingredient_3 = Ingredient.create!(name: "oil", calories: 100) 
    dish_ingredient_1 = DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_1.id)
    dish_ingredient_2 = DishIngredient.create!(dish_id: dish_2.id, ingredient_id: ingredient_2.id)
    dish_ingredient_3 = DishIngredient.create!(dish_id: dish_3.id, ingredient_id: ingredient_3.id)


end