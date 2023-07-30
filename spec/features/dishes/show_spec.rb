require 'rails_helper'

# US-1
# As a visitor
# When I visit a dish's show page
# I see the dish’s name and description
# And I see a list of ingredients for that dish
# and a total calorie count for that dish
# And I see the chef's name.
RSpec.describe "Dish Show Page", type: :feature do
  before(:each) do 
    @chef_1 = Chef.create!(name: "Goku")

    @dish_1 = @chef_1.dishes.create!(name: "Tuna", description: "Doesn't taste like chicken")

    @ingredients_1 = @dish_1.ingredients.create!(name: "Tuna", calories: 500)

    @dish_ingredients_1 = DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredients_1.id)
  end

  describe "As a visitor" do
    it "displays the dish's name and description and all dish info" do
        visit dish_path(@dish_1)

        expect(page).to have_content(@dish_1.name)
        expect(page).to have_content(@dish_1.description)
        expect(page).to have_content(@chef_1.name)
      
        within ".ingredients" do
          expect(page).to have_content(@ingredients_1.name)
          expect(page).to have_content(@ingredients_1.calories)
        end

    end
  end
end