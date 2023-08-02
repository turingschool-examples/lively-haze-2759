require 'rails_helper'

RSpec.describe 'the dishes show page' do
  describe "US 1" do
    chef = Chef.create!(name: "Burger Man")

    dish1 = chef.dishes.create!(name: 'Spaget', description: "noodles and sauce")
    ingredient1 = dish1.ingredients.create!(name: 'tomato', calories: 25)
    ingredient2 = dish1.ingredients.create!(name: 'noodle', calories: 35)
  
    it 'displays the name and description' do
      

      visit "/dishes/#{dish1.id}"

      expect(page).to have_content(dish1.name)
      expect(page).to have_content(dish1.description)
    end

    it 'displays the list of ingredients with their calories' do
      visit "/dishes/#{dish1.id}"
      expect(page).to have_content(ingredient1.name)
      expect(page).to have_content(ingredient2.calories)
    end

    it 'displays total calories' do
      visit "/dishes/#{dish1.id}"
      expect(page).to have_content(60)
    end

    it 'displays the chefs name associated with dish ' do
      visit "/dishes/#{dish1.id}"
      save_and_open_page
      expect(page).to have_content(chef.name)
    end



  end

  describe "US 2" do
    chef = Chef.create!(name: "Burger Man")

    dish1 = chef.dishes.create!(name: 'Spaget', description: "noodles and sauce")
    ingredient1 = dish1.ingredients.create!(name: 'tomato', calories: 25)
    ingredient2 = dish1.ingredients.create!(name: 'noodle', calories: 35)

    it "has a form to add new ingredients to the dish" do
      visit "/dishes/#{dish1.id}"

      fill_in "name", with: "Water"
      fill_in "calories", with: 150
      #save_and_open_page
      click_button('Save')
      #save_and_open_page
      expect(current_path).to eq("/dishes/#{dish1.id}")
      
      expect(page).to have_content("Water")
      expect(page).to have_content(210)
    end
  end

end