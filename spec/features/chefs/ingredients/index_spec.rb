require "rails_helper"

RSpec.describe "The Chefs Ingredients", type: :feature do
  before(:each) do
    test_data
  end
  describe "#index page" do
    it "displays a list of distinct ingredients" do
      visit chef_ingredients_path(@chef_2.id)

      expect(page).to have_content("Beef", count: 1)
      expect(page).to have_content("Fish", count: 1)
      expect(page).to have_content("Salt", count: 1)
      expect(page).to have_content("Onion", count: 1)
    end
  end
end