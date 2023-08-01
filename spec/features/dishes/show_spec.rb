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

    within("#calorie-count") do
      expect(page).to have_content("Calories")
      expect(dish.calorie_count).to eq(150)
    end

    within("#chef") do
      expect(page).to have_content("Chef")
      expect(page).to have_content("Name: Gordon")
    end
  end

  it "has a form to add an existing ingredient to the dish" do
    chef = Chef.create(name: "Gordon")
    dish = Dish.create(name: "Grilled Cheese", description: "A tasty dish", chef: chef)
    ingredient1 = Ingredient.create(name: "Cheese", calories: 50)
    ingredient2 = Ingredient.create(name: "Bread", calories: 100)

    visit dish_path(dish)

    within("#add-ingredient") do
      expect(page).to have_content("Add an Ingredient")
      expect(page).to have_field("dish[ingredient_id]") # Ensure the field with name="dish[ingredient_id]" is present
      fill_in("dish[ingredient_id]", with: ingredient1.id) # Use the ID of an existing ingredient
      click_on "Add Ingredient"
    end


    expect(current_path).to eq(dish_path(dish))
    expect(page).to have_content("Cheese")
  end
end