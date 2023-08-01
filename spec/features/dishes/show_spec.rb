require 'rails_helper'

RSpec.describe "Dish Show Page", type: :feature do
  before(:each) do 
    @chef_1 = Chef.create!(name: "Goku")

    @dish_1 = @chef_1.dishes.create!(name: "Tuna", description: "Doesn't taste like chicken")

    @ingredients_1 = @dish_1.ingredients.create!(name: "Mayo", calories: 500)
    @ingredients_2 = Ingredient.create!(name: "Pickles", calories: 100)

    # @dish_ingredients_1 = DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredients_1.id)
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
    it "has a form to add an existing ingredient to that dish" do
      visit dish_path(@dish_1)
      
      expect(page).to have_content("Add an Ingredient to this Dish")
      
      fill_in :ingredient_id, with: @ingredients_2.id
      
      find_button('Submit').click
      
      expect(current_path).to eq(dish_path(@dish_1))
      expect(page).to have_content(@ingredients_2.name)
    end
  end
end