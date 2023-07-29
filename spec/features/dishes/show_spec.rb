require "rails_helper"

RSpec.describe "The Dishes", type: :feature do
  before(:each) do
    test_data
  end
  describe "#show_page" do
    it "I see the dish name, description, list of ingredients and total calories" do

      visit dish_path(@dish_1.id)
      
      expect(page).to have_content("Soupe du jour: Vegetable")
      expect(page).to have_content("Delicious, splendide")
      expect(page).to have_content("Carrot")
      expect(page).to have_content("Onion")
      expect(page).to have_content("Salt")
      expect(page).to have_content(140)
      expect(page).to have_content("Pierre Le Plupe")

      expect(page).to_not have_content("Big Mac")
    end
  end
end