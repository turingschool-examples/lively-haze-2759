require "rails_helper"

RSpec.describe "The Dishes", type: :feature do
  before(:each) do
    test_data
  end
  describe "#show_page" do
    it "displays the dish name, description, list of ingredients and total calories" do

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

    it "displays a form to add an existing ingredient to the dish" do

      visit dish_path(@dish_2.id)

      within("#add_ingredient") do
        fill_in @dish, with: @ingredient_4.id
        click_button "Update Dish"
      end
      expect(page).to have_content("Chicken")
      expect(@dish_2.ingredients).to eq([@ingredient_1,@ingredient_2,@ingredient_4,@ingredient_6])
      expect(current_path).to eq(dish_path(@dish_2.id))
    end
  end
end