require 'rails_helper'

RSpec.describe "Dish #show page", type: :feature do
  describe "When I visit a Dish's show page" do
    before :each do
      @chef_1 = Chef.create!(name: "Gordon Ramsay")

      @dish_1 = @chef_1.dishes.create!(name: "Beef Wellington", description: "Some fancy beef meal")
      @dish_2 = @chef_1.dishes.create!(name: "Chicken Piccata", description: "Some delicious chicken meal")

      @beef = Ingredient.create!(name: "Beef Tenerloin", calories: 213)
      @salt = Ingredient.create!(name: "Salt", calories: 60)
      @pepper = Ingredient.create!(name: "Pepper", calories: 75)
      @pastry = Ingredient.create!(name: "Puff Pastry", calories: 438)
      
      @chicken = Ingredient.create!(name: "Chicken", calories: 120)
      @garlic = Ingredient.create!(name: "Garlic", calories: 80)
      @lemon = Ingredient.create!(name: "Lemon", calories: 76)
      @cream = Ingredient.create!(name: "Heavy Cream", calories: 120)
      @capers = Ingredient.create!(name: "Capers", calories: 60)

      DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @beef.id)
      DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @salt.id)
      DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @pepper.id)
      DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @pastry.id)

      DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @chicken.id)
      DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @garlic.id)
      DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @lemon.id)
      DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @cream.id)
      DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @capers.id)

      visit dish_path(@dish_1)
    end

    it "shows the dish's name and description" do
      expect(page).to have_content(@dish_1.name, count: 1)
      expect(page).to have_content(@dish_1.description, count: 1)
      
      expect(page).to_not have_content(@dish_2.name)
      expect(page).to_not have_content(@dish_2.description)
    end

    it "also shows a list of ingredients for that dish" do
      expect(page).to have_content(@dish_1.ingredients[0].name)
      expect(page).to have_content(@dish_1.ingredients[1].name)
  
      expect(page).to_not have_content(@dish_2.ingredients[0].name)
      expect(page).to_not have_content(@dish_2.ingredients[1].name)
    end

    it "shows a total calorie count for that dish" do
      expect(page).to have_content("Total Calories: #{@dish_1.total_calories}")
    end

    it "shows the chef's name" do
      expect(page).to have_content("Dish curated by Chef #{@dish_1.chef.name}")
    end
  end
end