require 'rails_helper'

RSpec.describe "chef's show page", type: :feature do
  before(:each) do
    @chef = Chef.create!(name: "Jean Francois Meteigner")
    @dish = @chef.dishes.create!(name: "Filet Mignon", description: "A tender and expensive cut of beef", chef_id: @chef)
    
    @ingredient_1 = @dish.ingredients.create!(name: "USDA Prime Beef Filet Mignon", calories: 227)
    @ingredient_2 = @dish.ingredients.create!(name: "Kosher Salt", calories: 1)
    @ingredient_3 = @dish.ingredients.create!(name: "Vegetable Oil", calories: 119)
  end

  describe "as a visitor" do
    describe "when I visit a chef's show page" do
      it "I see a link to view a list of all ingredients that this chef uses in their dishes. When I click on that link, I'm taken to a chef's ingredients index page, and I can see a unique list of names of all the ingredients that this chef uses." do
        visit chef_path(@chef)

        expect(page).to have_link("View Ingredients")

        click_on "View Ingredients"
        expect(page).to have_current_path(chef_ingredients_path(@chef))
        
        @chef.ingredients.each do |ingredient|
          expect(page).to have_content(ingredient.name)
        end
      end
    end
  end
end