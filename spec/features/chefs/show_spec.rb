require 'rails_helper'

RSpec.describe "Chef's Show page", type: :feature do
  describe "When I visit a chef's show page" do
    before :each do
      @chef_1 = Chef.create!(name: "Gordon Ramsay")
      @chef_2 = Chef.create!(name: "David Chang")
      
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
      DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @pepper.id)
      DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @salt.id)

      visit chef_path(@chef_1)
    end

    it "Has a link to view a list of all ingredients that this chef uses in their dishes" do
      expect(page).to have_link("All Dishes' Ingredients", href: chef_ingredients_path(@chef_1), count: 1)

      expect(page).to_not have_link(href: chef_ingredients_path(@chef_2))
    end

    it "When click, takes me to the chef's ingredients index page" do
      click_link("All Dishes' Ingredients")
      expect(current_path).to eq(chef_ingredients_path(@chef_1))
    end

    it "shows a unique list of all ingredients that this chef uses" do
      click_link("All Dishes' Ingredients")

      expect(page).to have_content(@beef.name, count: 1)
      expect(page).to have_content(@salt.name, count: 1)
      expect(page).to have_content(@pepper.name, count: 1)
      expect(page).to have_content(@pastry.name, count: 1)
      expect(page).to have_content(@chicken.name, count: 1)
      expect(page).to have_content(@garlic.name, count: 1)
      expect(page).to have_content(@lemon.name, count: 1)
      expect(page).to have_content(@cream.name, count: 1)
      expect(page).to have_content(@capers.name, count: 1)
    end
  end
end