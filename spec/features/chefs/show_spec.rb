require 'rails_helper'

RSpec.describe "chef's show page", type: :feature do
  before(:each) do
    @chef = Chef.create!(name: "Jean Francois Meteigner")
    @dish = @chef.dishes.create!(name: "Filet Mignon", description: "A tender and expensive cut of beef", chef_id: @chef)
    
    @ingredient_1 = @dish.ingredients.create!(name: "USDA Prime Beef Filet Mignon", calories: 227)
    @ingredient_2 = @dish.ingredients.create!(name: "Kosher Salt", calories: 1)
    @ingredient_3 = @dish.ingredients.create!(name: "Vegetable Oil", calories: 119)
    @ingredient_4 = @dish.ingredients.create!(name: "Kosher Salt", calories: 1)
    @ingredient_5 = @dish.ingredients.create!(name: "Pepper", calories: 0)
    
    ## User Story Extension
    @dish_2 = @chef.dishes.create!(name: "Chicken Alfredo", description: "Creamy pasta dish with grilled chicken")
    @dish_3 = @chef.dishes.create!(name: "Caesar Salad", description: "Classic salad with romaine lettuce")

    @ingredient_6 = @dish_2.ingredients.create!(name: "Chicken Breast", calories: 165)
    @ingredient_7 = @dish_3.ingredients.create!(name: "Romaine Lettuce", calories: 8)
    @ingredient_8 = @dish_3.ingredients.create!(name: "Parmesan Cheese", calories: 122)
    @ingredient_9 = @dish_3.ingredients.create!(name: "Croutons", calories: 122)

    @salt = Ingredient.create!(name: "Kosher Salt", calories: 0)
    @pepper = Ingredient.create!(name: "Pepper", calories: 3)
    @cheese = Ingredient.create!(name: "Cheese", calories: 25)
    @dish.ingredients << @cheese
    @dish_2.ingredients << @pepper
    @dish_2.ingredients << @salt
    @dish_2.ingredients << @cheese
    @dish_3.ingredients << @salt
    @dish_3.ingredients << @cheese
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

      it "I see the three most popular ingredients that the chef uses in their dishes (Popularity is based off of how many dishes use that ingredient)" do
        visit chef_path(@chef)

        expect(page).to have_content("Most Popular Ingredients")
      end
    end
  end
end