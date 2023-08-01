require "rails_helper"

RSpec.describe "dish show page" do
  it "should show dish attributes and list of ingredients for dish with total calorie count and chef name" do
    chef = Chef.create(name: "Gordon")
    dish = Dish.create(name: "Grilled Cheese", description: "A tasty dish", chef: chef)
    ingredient1 = Ingredient.create(name: "Cheese", calories: 50)
    ingredient2 = Ingredient.create(name: "Bread", calories: 100)

    dish.ingredients << [ingredient1, ingredient2]
    
    visit dish_path(dish)

   
    expect(page).to have_content("Main Dish")
    expect(page).to have_content("Name: Grilled Cheese")
    expect(page).to have_content("Description: A tasty dish")
 

    within("#ingredients") do
      expect(page).to have_content("Ingredients")
      expect(page).to have_content("Cheese")
      expect(page).to have_content("Bread")
    end

    within("#chef") do
      expect(page).to have_content("Chef")
      expect(page).to have_content("Name: Gordon")
    end
  end
end