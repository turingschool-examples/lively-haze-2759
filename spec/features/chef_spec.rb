require 'rails_helper'

RSpec.describe Chef do

  #Story 3 of 3

  describe "When I visit a chef's show page" do
    describe "I see a link to view a list of all ingredients that this chef uses in their dishes." do
      describe "When I click on that link" do
        describe "I'm taken to a chef's ingredients index page" do
          it "and I can see a unique list of names of all the ingredients that this chef uses." do
            @chef_1 = Chef.create!(name: "Gordon")
            @dish_1 = Dish.create!(name: "Lasagna", description: "This is a lasagna", chef: @chef_1)
            @dish_2 = Dish.create!(name: "Basically a Lasagna", description: "This is a basically a lasagna", chef: @chef_1)
            @ingredient_1 = Ingredient.create!(name: "Tomato", calories: 10)
            @ingredient_2 = Ingredient.create!(name: "Meat", calories: 20)
            @ingredient_3 = Ingredient.create!(name: "Noodles", calories: 30)

            @dish_1.ingredients << @ingredient_1
            @dish_1.ingredients << @ingredient_2
            @dish_1.ingredients << @ingredient_3

            @dish_2.ingredients << @ingredient_1
            @dish_2.ingredients << @ingredient_2
            @dish_2.ingredients << @ingredient_3

            visit "/chefs/#{@chef_1.id}"

            expect(page).to have_link("Chefs Ingredients")

            click_link "Chefs Ingredients"

            expect(current_path).to eq("/chefs/#{@chef_1.id}/ingredients")

            expect(page).to have_content(@ingredient_1.name, count: 1)
            expect(page).to have_content(@ingredient_2.name, count: 1)
            expect(page).to have_content(@ingredient_3.name, count: 1)
          end
        end
      end
    end
  end
end