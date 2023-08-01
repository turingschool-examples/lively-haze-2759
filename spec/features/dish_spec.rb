require 'rails_helper'

RSpec.describe Dish do
#Story 1 of 3
  describe "As a visitor" do
    describe "When I visit a dish's show page" do
      describe "I see the dish’s name and description" do
        describe "And I see a list of ingredients for that dish" do
          describe "and a total calorie count for that dish" do
            it "And I see the chef's name." do
              @chef_1 = Chef.create!(name: "Gordon")
              @dish_1 = Dish.create!(name: "Lasagna", description: "This is a lasagna", chef: @chef_1)
              @ingredient_1 = Ingredient.create!(name: "Tomato", calories: 10)
              @ingredient_2 = Ingredient.create!(name: "Meat", calories: 20)
              @ingredient_3 = Ingredient.create!(name: "Noodles", calories: 30)
              @dish_1.ingredients << @ingredient_1
              @dish_1.ingredients << @ingredient_2
              @dish_1.ingredients << @ingredient_3

              visit "/dishes/#{@dish_1.id}"

              total_calories = (@ingredient_1.calories + @ingredient_2.calories + @ingredient_3.calories)
              
              expect(page).to have_content(@dish_1.name)
              expect(page).to have_content(@dish_1.description)
              expect(page).to have_content(@ingredient_1.name)
              expect(page).to have_content(@ingredient_2.name)
              expect(page).to have_content(@ingredient_3.name)
              expect(page).to have_content(total_calories)
              expect(page).to have_content(@chef_1.name)
            end
          end
        end
      end
    end
  end
end