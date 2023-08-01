require 'rails_helper'

RSpec.describe "dishes show page", type: :feature do


  # let!(:chef_1) { Chef.create!(name: "andi") }
  # let!(:dish_1) { chef_1.dishes.create!(name: "gumbo", description: "seafood") }
  # let!(:ingredient_1) { Ingredient.create!(name: "shrimp", calories: 100) }
  # let!(:dish_ingredient_1) { DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_1.id) }
  
  # let!(:chef_2) { Chef.create!(name: "seth") }
  # let!(:dish_2) { chef_2.dishes.create!(name: "bread", description: "flour") }
  # let!(:ingredient_2) { Ingredient.create!(name: "flour", calories: 10) }
  # let!(:dish_ingredient_2) { DishIngredient.create!(dish_id: dish_2.id, ingredient_id: ingredient_2.id) }


  # let!(:chef_3) { Chef.create!(name: "jill") }
  # let!(:dish_3) { chef_3.dishes.create!(name: "steak", description: "beef") }
  # let!(:ingredient_3) { Ingredient.create!(name: "beef", calories: 50) }
  # let!(:dish_ingredient_1) { DishIngredient.create!(dish_id: dish_3.id, ingredient_id: ingredient_3.id) }




  # before do
  #   visit dish_path(dish_1)
  # end

  it "displays dish name, description, ingredients, calorie count, and chef's name" do
    chef_1 = Chef.create!(name: "andi")
    chef_2 = Chef.create!(name: "seth")
    dish_1 = chef_1.dishes.create!(name: "gumbo", description: "seafood") 
    dish_2 = chef_2.dishes.create!(name: "bread", description: "flour") 
    ingredient_1 = Ingredient.create!(name: "shrimp", calories: 100) 
    dish_ingredient_1 = DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_1.id) 
    
    visit dish_path(dish_1)

    expect(page).to have_content(dish_1.name)
    expect(page).to have_content(dish_1.description)
    expect(page).to have_content(ingredient_1.name)
    expect(page).to have_content(ingredient_1.calories)
    expect(page).to have_content(chef_1.name)
    expect(page).to_not have_content(dish_2.description)
  end


end
