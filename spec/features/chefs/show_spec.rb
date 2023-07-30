require "rails_helper"

RSpec.describe "chef's show page", type: :feature do

# As a visitor
# When I visit a chef's show page
# I see a link to view a list of all ingredients 
# that this chef uses in their dishes.
# When I click on that link
# I'm taken to a chef's ingredients index page
# and I can see a unique list of names of all the 
# ingredients that this chef uses.

  describe "when I visit a chef's show page" do
    it "has a link to view a list of all ingredients, that this chef uses in thier dishes" do
      chef = Chef.create!(name: "Derek Chavez")
      dish_1 = chef.dishes.create!(name: "Rice", description: "Crucial")
      dish_2 = chef.dishes.create!(name: "Yummy", description: "Very good")

      ingredient_1 = Ingredient.create!(name: "Water", calories: 0)
      ingredient_2 = Ingredient.create!(name: "Salt", calories: 10)
      ingredient_3 = Ingredient.create!(name: "Cilantro", calories: 15)
      ingredient_4 = Ingredient.create!(name: "Pasta", calories: 100)
      ingredient_5 = Ingredient.create!(name: "Chicken", calories: 150)
      ingredient_6 = Ingredient.create!(name: "Pesto", calories: 75)

      dish_1.ingredients << ingredient_1
      dish_1.ingredients << ingredient_2
      dish_1.ingredients << ingredient_3

      dish_2.ingredients << ingredient_4
      dish_2.ingredients << ingredient_5
      dish_2.ingredients << ingredient_6

      visit chef_path(chef)

      expect(page).to have_content(ingredient_1.name)
      expect(page).to have_content(ingredient_2.name)
      expect(page).to have_content(ingredient_3.name)
      expect(page).to have_content(ingredient_4.name)
      expect(page).to have_content(ingredient_5.name)
      expect(page).to have_content(ingredient_6.name)
    end
  end
end