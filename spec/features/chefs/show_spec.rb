require 'rails_helper'

RSpec.describe 'the chef show page' do
  describe "US 3" do
    chef = Chef.create!(name: "Burger Man")

    dish1 = chef.dishes.create!(name: 'Spaget', description: "noodles and sauce")
    ingredient1 = dish1.ingredients.create!(name: 'tomato', calories: 25)
    ingredient2 = dish1.ingredients.create!(name: 'noodle', calories: 35)
    dish2 = chef.dishes.create!(name: 'Something', description: "bread and egg")
    ingredient3 = dish1.ingredients.create!(name: 'bread', calories: 50)
    ingredient4 = dish1.ingredients.create!(name: 'egg', calories: 45)

    it "displays a link to view this chefs show page" do
        visit "/chefs/#{chef.id}"

      expect(page).to have_content(chef.name)
      expect(page).to have_link("List of Ingredients")
      click_on "List of Ingredients"
      
      expect(current_path).to eq("/chefs/#{chef.id}/chef_ingredients")
      expect(page).to have_content(ingredient1.name)
      expect(page).to have_content(ingredient3.name)

    end
  end
end