require 'rails_helper'

RSpec.describe "dishes show page", type: :feature do
  before :each do
    @chef_1 = Chef.create!(name: "That One Guy")
      
    @spaget = @chef_1.dishes.create!(name: "Noodles", description: "very good much wow")
    
    @sauce = Ingredient.create!(name: "Tomato Sauce", calories: 1234)
    @carrot = Ingredient.create!(name: "Carrots", calories: 12)
    @beef = Ingredient.create!(name: "Beef", calories: 321)
    @zuc = Ingredient.create!(name: "Zucchini", calories: 342)
    
    @spaget.ingredients << @sauce
    @spaget.ingredients << @carrot
    @spaget.ingredients << @beef
    @spaget.ingredients << @zuc
  end
  describe "When I visit a dish's show page" do 
    it "has the dishes name and description" do 
      visit dish_path(@spaget)

      expect(page).to have_content(@spaget.name)
      expect(page).to have_content(@spaget.description)
    end

    it "has a list of ingredients and the calories and the chefs name" do
      visit dish_path(@spaget)

      expect(page).to have_content("#{@sauce.name}, Calories: #{@sauce.calories}")
      expect(page).to have_content("#{@carrot.name}, Calories: #{@carrot.calories}")
      expect(page).to have_content("#{@beef.name}, Calories: #{@beef.calories}")
      expect(page).to have_content("#{@zuc.name}, Calories: #{@zuc.calories}")
      expect(page).to have_content(@chef_1.name)
    end
  end
end