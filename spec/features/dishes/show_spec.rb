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
    end
  end
end