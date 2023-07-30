require "rails_helper"

RSpec.describe "dishes show page", type: :feature do
  
# As a visitor
# When I visit a dish's show page
# I see the dish’s name and description
# And I see a list of ingredients for that dish
# and a total calorie count for that dish
# And I see the chef's name.

  describe "when i visit a dish's show page" do
    it "displays the dish's name and description" do
      chef = Chef.create!(name: "Derek Chavez")
      dish_1 = chef.dishes.create!(name: "Rice", description: "Crucial")

      visit dish_path(dish_1)

      expect(page).to have_content(dish_1.name)
      expect(page).to have_content(dish_1.description)
    end
  end
end