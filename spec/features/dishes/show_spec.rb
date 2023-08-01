require "rails_helper"
require "spec_data"

RSpec.describe "Dish Show Page", type: :feature do
  before :each do
    dish_test_data

    visit dish_path(@dish1)
  end

  it "I see the dish's name and description" do 
    within("#dish_info") do
      expect(page).to have_content(@dish1.name)
      expect(page).to have_content(@dish1.description)
    end
  end
  
  it "I see a list of ingredients for that dish" do
    within("#dish_ingredients") do
      expect(page).to have_content(@ingredient1.name)
      expect(page).to have_content(@ingredient2.name)
    end
  end

  it "I see the total calorie count of the dish" do
    within("#dish_nutrition") do
      expect(page).to have_content(@dish1.calories)
    end
  end

  it "I see the chef's name" do
    within("#dish_chef") do
      expect(page).to have_content(@chef.name)
    end
  end

  it "I see a form to add an existing Ingredient to that dish" do
    within("#new_dish_ingredient") do
      expect(page).to have_field("dish_ingredient[ingredient_id]")
    end
  end

  describe "When I fill in the form with the ID of an Ingredient that exists in the database and click submit" do
    it "I am redirected to the Dish's show page and the Ingredient is now listed on the page" do
      within("#dish_ingredients") do
        expect(page).to_not have_content(@ingredient3.name)
      end
      
      within("#new_dish_ingredient") do
        fill_in("dish_ingredient[ingredient_id]", with: @ingredient3.id)
        click_button("Add Ingredient")
      end

      expect(current_path).to eq(dish_path(@dish1))

      save_and_open_page
      within("#dish_ingredients") do
        expect(page).to have_content(@ingredient3.name)
      end
    end
  end
end