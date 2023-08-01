require "rails_helper"

RSpec.describe "chef show page" do
  it "shows the 3 most popular ingredients that the chef uses in their dishes" do
    chef = Chef.create(name: "Gordon")

    # Create ingredients
    ingredient1 = Ingredient.create(name: "Cheese", calories: 50)
    ingredient2 = Ingredient.create(name: "Bread", calories: 100)
    ingredient3 = Ingredient.create(name: "Pasta", calories: 150)
    ingredient4 = Ingredient.create(name: "Tomato Sauce", calories: 80)
    ingredient5 = Ingredient.create(name: "Eggs", calories: 70)
    ingredient6 = Ingredient.create(name: "Mushrooms", calories: 30)

    # Create dishes associated with the chef
    dish1 = Dish.create(name: "Grilled Cheese", description: "A tasty dish", chef: chef)
    dish1.ingredients << [ingredient1, ingredient2]

    dish2 = Dish.create(name: "Pasta", description: "Delicious pasta", chef: chef)
    dish2.ingredients << [ingredient3, ingredient4]

    dish3 = Dish.create(name: "Omelette", description: "Fluffy omelette", chef: chef)
    dish3.ingredients << [ingredient5, ingredient6]

    dish4 = Dish.create(name: "Pizza", description: "Tasty pizza", chef: chef)
    dish4.ingredients << [ingredient1, ingredient4, ingredient6]

    visit chef_path(chef)

    expect(page).to have_content("Name: Gordon")

    within("#popular-ingredients") do
      expect(page).to have_content("Most Popular Ingredients")
      expect(page).to have_content("Cheese")
      expect(page).to have_content("Tomato Sauce")
      expect(page).to have_content("Mushrooms")
      expect(page).not_to have_content("Bread") # Pasta is only used in one dish
      expect(page).not_to have_content("Eggs")  # Eggs and Mushrooms are only used in one dish
    end
  end
end

  