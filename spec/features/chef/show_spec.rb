require "rails_helper"

RSpec.describe "Ched Show Page" do
  describe "As a visitor" do
    it "shows a linl to list all ingredients" do
      chef_1 = Chef.create!(name: "Chef Boyardee")
      dish_1 = Dish.create!(name: "Capellini Pomodoro", description: "Capellini Pomodoro is a classic combo of pasta, tomato sauce, garlic, olive oil, and basil.", chef: chef_1)
      ingredient_1 = Ingredient.create!(name: "Capellini", calories: 120)
      ingredient_2 = Ingredient.create!(name: "Tomato Sauce", calories: 80)
      ingredient_3 = Ingredient.create!(name: "Garlic", calories: 10)
      dish_1.ingredients << ingredient_1
      dish_1.ingredients << ingredient_2
      
      visit chef_path(chef_1)

      expect(page).to have_link("View All Ingredients")

      click_on "All Ingredients"
      
      expect(current_path).to eq(ingredients_chef_path(chef_1))
      expect(page).to have_content(ingredient_1.name)
      expect(page).to have_content(ingredient_2.name)
      expect(page).not_to have_content(ingredient_3.name)
    end
  end
end
