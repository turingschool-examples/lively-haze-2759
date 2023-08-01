require 'rails_helper'

RSpec.describe "Chefs show page", type: :feature do
  before :each do
    @chef_1 = Chef.create!(name: "That One Guy")
      
    @spaget = @chef_1.dishes.create!(name: "Noodles", description: "very good much wow")
    @steak = @chef_1.dishes.create!(name: "Steak", description: "mmmmm")
    
    @sauce = Ingredient.create!(name: "Tomato Sauce", calories: 1234)
    @carrot = Ingredient.create!(name: "Carrots", calories: 12)
    @beef = Ingredient.create!(name: "Beef", calories: 321)
    @zuc = Ingredient.create!(name: "Zucchini", calories: 342)
    @squash = Ingredient.create!(name: "Squash", calories: 400)
    
    @meat = Ingredient.create!(name: "Ribeye", calories: 1400)
    @butter = Ingredient.create!(name: "Butter", calories: 1400)
    @mash = Ingredient.create!(name: "Mashed Potatos", calories: 400)
    
    @spaget.ingredients << @sauce
    @spaget.ingredients << @carrot
    @spaget.ingredients << @beef
    @spaget.ingredients << @zuc

    @steak.ingredients << @meat
    @steak.ingredients << @mash
    @steak.ingredients << @butter
    @steak.ingredients << @butter
    @steak.ingredients << @butter
  end

  describe "When I visit a chef's show page" do 
    it "Has a link to view a list of all ingredients" do 
      visit chef_path(@chef_1)

      expect(page).to have_link("View all Ingredients")
    end

    it "Has a link to view a list of all ingredient when clicked it takes me to ingredients index page" do 
      visit chef_path(@chef_1)

      expect(current_path).to eq(chef_path(@chef_1))

      click_link("View all Ingredients")
      expect(current_path).to eq(chef_ingredients_path(@chef_1))
    end
  end
end