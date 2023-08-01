require "rails_helper"

RSpec.describe "dish's show page" do
  before(:each) do
    @chef_1 = Chef.create!(name: 'robert')
    @chef_2 = Chef.create!(name: 'shelly')
    @dish_1 = @chef_1.dishes.create!(name: "waffle", description: "stacked")
    @dish_2 = @chef_1.dishes.create!(name: "beans", description: "baked")
    @ingredient_1 = @dish_1.ingredients.create!(name: 'syrup', calories: 3)
    @ingredient_2 = @dish_2.ingredients.create!(name: 'bean', calories: 4)
    @ingredient_3 = Ingredient.create!(name: 'flour', calories: 6)
  end
  #As a visitor
  #When I visit a dish's show page
  #I see the dish’s name and description
  #And I see a list of ingredients for that dish
  #and a total calorie count for that dish And I see the chef's name.
    describe "When I visit a dish's show page" do
      it "I see the dish’s name and description" do
        visit "/dishes/#{@dish_1.id}"
        
        expect(page).to have_content(@dish_1.name)
        expect(page).to have_content(@chef_1.name)
        expect(page).to have_content(@dish_1.description)
        expect(page).to have_content(@ingredient_1.name)
        expect(page).to have_content(@ingredient_1.calories)

      end

      it "I see a form to add an existing Ingredient to that Dish." do
        visit "/dishes/#{@dish_1.id}"
        
   
        expect(find('#add-ingredient-form')).to have_content("Add a Ingredient to #{@dish_1.name}")
        expect(find('#add-ingredient-form')).to have_selector('input[name="ingredient_id"]')
        fill_in "ingredient_id", with: @ingredient_3.id
        click_button "Submit"

      end
    
  end

end