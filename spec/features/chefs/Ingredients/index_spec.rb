require "rails_helper"

RSpec.describe "ingredients index page" do
  before(:each) do
    @chef_1 = Chef.create!(name: 'robert')
    @chef_2 = Chef.create!(name: 'shelly')
    @dish_1 = @chef_1.dishes.create!(name: "waffle", description: "stacked")
    @dish_2 = @chef_1.dishes.create!(name: "beans", description: "baked")
    @ingredient_1 = @dish_1.ingredients.create!(name: 'syrup', calories: 3)
    @ingredient_2 = @dish_2.ingredients.create!(name: 'bean', calories: 4)
    @ingredient_3 = Ingredient.create!(name: 'flour', calories: 6)
  end
# I'm taken to a chef's ingredients index page
# and I can see a unique list of names of all the ingredients that this chef uses.
    describe "When I index" do
      it "I can see a unique list of names of all the ingredients that this chef uses." do
        visit "/ingredients/index"
        
        expect(page).to have_content(@ingredient_1.name)
        

      end

      
    
  end

end