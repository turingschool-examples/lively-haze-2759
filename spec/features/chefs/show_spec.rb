require "rails_helper"

RSpec.describe "The Chefs", type: :feature do
  before(:each) do
    test_data
  end
  describe "#show page" do
    it "displays a link to view all ingredients in the chefs dishes" do

      visit chef_path(@chef_2.id)
      
      expect(page).to have_link("Chef ingredients", href: chef_ingredients_path(@chef_2.id))
    end
  end
end