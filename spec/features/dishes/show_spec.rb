require 'rails_helper'

RSpec.describe "dish's show page", type: :feature do
  before(:each) do
    @chef = Chef.create!(name: "Jean Francois Meteigner")
    @dish = @chef.dishes.create!(name: "Filet Mignon", description: "A tender and expensive cut of beef", chef_id: @chef)
    
    @ingredient_1 = @dish.ingredients.create!(name: "USDA Prime Beef Filet Mignon", calories: 227)
    @ingredient_2 = @dish.ingredients.create!(name: "Kosher Salt", calories: 1)
    @ingredient_3 = @dish.ingredients.create!(name: "Vegetable Oil", calories: 119)
  end

  describe "as a visitor" do
    describe "when I visit a dish's show page" do
      it "I see the dish's name and description, I see a list of ingredients for that dish, and a total calorie count for that dish, and I see the chef's name" do
        visit dish_path(@dish)

        expect(page).to have_content(@dish.name)
        expect(page).to have_content(@dish.description)

        @dish.ingredients.each do |ingredient|
          expect(page).to have_content(ingredient.name)
          expect(page).to have_content(ingredient.calories)
        end

        # model method for total_calories
        expect(page).to have_content("Total Calories:")
        expect(page).to have_content(@chef.name)
      end

      it "I see a form to add an existing Ingredient to that Dish
      When I fill in the form with the ID of an Ingredient that exists in the database, And I click Submit, Then I am redirected to that dish's show page, And I see that ingredient is now listed." do
        ingredient_4 = Ingredient.create!(name: "Pepper", calories: 3)
        
        visit dish_path(@dish)

        within("#ingredient-list") do
          expect(page).to_not have_content(ingredient_4.name)
          expect(page).to_not have_content(ingredient_4.calories)
        end

        expect(page).to have_content("Add an Ingredient")
        expect(page).to have_field(:ingredient_id)

        within("#add-ingredient") do
          select "Pepper"
          click_on "Submit"
        end

        expect(page).to have_current_path(dish_path(@dish))
        
        within("#ingredient-list") do
          expect(page).to have_content(ingredient_4.name)
          expect(page).to have_content(ingredient_4.calories)
        end
      end
    end
  end
end