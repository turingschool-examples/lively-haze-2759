require "rails_helper"

RSpec.describe "dishes show page", type: :feature do
  
# As a visitor
# When I visit a dish's show page
# I see the dish’s name and description
# And I see a list of ingredients for that dish
# and a total calorie count for that dish
# And I see the chef's name.

  describe "when i visit a dish's show page" do
    it "displays the dish's name and description" do
      chef = Chef.create!(name: "Derek Chavez")
      dish_1 = chef.dishes.create!(name: "Rice", description: "Crucial")

      visit dish_path(dish_1)
      
      expect(page).to have_content(dish_1.name)
      expect(page).to have_content(dish_1.description)
    end
    
    it "displays a list of ingredients for that dish" do
      chef = Chef.create!(name: "Derek Chavez")
      dish_1 = chef.dishes.create!(name: "Rice", description: "Crucial")

      ingredient_1 = Ingredient.create!(name: "Water", calories: 0)
      ingredient_2 = Ingredient.create!(name: "Salt", calories: 10)

      dish_1.ingredients << ingredient_1
      dish_1.ingredients << ingredient_2

      visit dish_path(dish_1)

      expect(page).to have_content(ingredient_1.name)
      expect(page).to have_content(ingredient_2.name)
    end

    it "displays a total calorie count for the dish and the chefs name for the dish" do
      chef = Chef.create!(name: "Derek Chavez")
      dish_1 = chef.dishes.create!(name: "Rice", description: "Crucial")

      ingredient_1 = Ingredient.create!(name: "Water", calories: 0)
      ingredient_2 = Ingredient.create!(name: "Salt", calories: 10)

      dish_1.ingredients << ingredient_1
      dish_1.ingredients << ingredient_2

      visit dish_path(dish_1)

      expect(page).to have_content(10)
      expect(page).to have_content("Derek Chavez")
    end
  end

  # As a visitor
  # When I visit a dish's show page
  # I see a form to add an existing Ingredient to that Dish
  # When I fill in the form with the ID of an Ingredient that exists in the database
  # And I click Submit
  # Then I am redirected to that dish's show page
  # And I see that ingredient is now listed.  

  describe "when i visit a dish's show page" do
    it "displays a form to add an existing ingredient to that dish" do
      chef = Chef.create!(name: "Derek Chavez")
      dish_1 = chef.dishes.create!(name: "Rice", description: "Crucial")

      ingredient_1 = Ingredient.create!(name: "Water", calories: 0)
      ingredient_2 = Ingredient.create!(name: "Salt", calories: 10)
      ingredient_3 = Ingredient.create!(name: "Cilantro", calories: 15)


      dish_1.ingredients << ingredient_1
      dish_1.ingredients << ingredient_2

      visit dish_path(dish_1)

      expect(page).to have_content("Add Ingredient")
      expect(page).to have_selector("form")
    end

    it "redirects me back to the dishes show page after I fill in the form with an existing ingredients :id and I click submit" do
      chef = Chef.create!(name: "Derek Chavez")
      dish_1 = chef.dishes.create!(name: "Rice", description: "Crucial")

      ingredient_1 = Ingredient.create!(name: "Water", calories: 0)
      ingredient_2 = Ingredient.create!(name: "Salt", calories: 10)
      ingredient_3 = Ingredient.create!(name: "Cilantro", calories: 15)


      dish_1.ingredients << ingredient_1
      dish_1.ingredients << ingredient_2

      visit dish_path(dish_1)

      fill_in "dish_ingredient_id", with: ingredient_3.id

      click_button "Submit"

      expect(page).to have_current_path(dish_path(dish_1))
      expect(page).to have_content(ingredient_3.name)
    end
  end
end