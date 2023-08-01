require "rails_helper"

RSpec.describe "Dish Show Page" do
  describe "As a visitor" do
    it "I see the dish name and description, list of ingredients, and chef's name" do
      chef_1 = Chef.create!(name: "Chef Boyardee")
      dish_1 = Dish.create!(name: "Capellini Pomodoro", description: "Capellini Pomodoro is a classic combo of pasta, tomato sauce, garlic, olive oil, and basil.", chef: chef_1)
      ingredient_1 = Ingredient.create!(name: "Capellini", calories: 120)
      ingredient_2 = Ingredient.create!(name: "Tomato Sauce", calories: 80)
      dish_1.ingredients << ingredient_1
      dish_1.ingredients << ingredient_2
      visit dish_path(dish_1)

      expect(page).to have_content(dish_1.name)
      expect(page).to have_content(dish_1.description)
      expect(page).to have_content(ingredient_1.name)
      expect(page).to have_content(ingredient_2.name)
      expect(page).to have_content(chef_1.name)
      expect(page).to have_content("Total Calories: 200")
    end
    it "Can add ingredients to a dish" do
      chef_1 = Chef.create!(name: "Chef Boyardee")
      dish_1 = Dish.create!(name: "Capellini Pomodoro", description: "Capellini Pomodoro is a classic combo of pasta, tomato sauce, garlic, olive oil, and basil.", chef: chef_1)
      ingredient_1 = Ingredient.create!(name: "Capellini", calories: 120)
      ingredient_2 = Ingredient.create!(name: "Tomato Sauce", calories: 80)
      ingredient_3 = Ingredient.create!(name: "Garlic", calories: 10)
      dish_1.ingredients << ingredient_1
      dish_1.ingredients << ingredient_2
      visit dish_path(dish_1)

      expect(page).to have_content(ingredient_1.name)
      expect(page).not_to have_content(ingredient_3.name)

      fill_in :dish_id, with: ingredient_3.id
      click_on "Update Dish"

      expect(current_path).to eq(dish_path(dish_1))
      expect(page).to have_content(ingredient_3.name)
    end
  end
end
