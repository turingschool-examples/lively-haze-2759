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
end