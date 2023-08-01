RSpec.describe "Chefs ingredients index page", type: :feature do
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
    @spaget.ingredients << @sauce
    @spaget.ingredients << @carrot
    @spaget.ingredients << @beef
    @spaget.ingredients << @zuc
    
    @steak.ingredients << @sauce
    @steak.ingredients << @meat
    @steak.ingredients << @mash
    @steak.ingredients << @butter
    @steak.ingredients << @butter
    @steak.ingredients << @butter
  end

  describe "When I visit a chef's show page" do 
    describe "And click view all ingredients" do
      it "Has a list of all ingredients used in all chefs dishes" do 
        visit chef_ingredients_path(@chef_1)

        expect(page).to have_content(@sauce.name)
        expect(page).to have_content(@carrot.name)
        expect(page).to have_content(@beef.name)
        expect(page).to have_content(@zuc.name)
        expect(page).to have_content(@meat.name)
        expect(page).to have_content(@mash.name)
        expect(page).to have_content(@butter.name)
        expect(page).to_not have_content(@sauce.name, count: 3)
        save_and_open_page
      end
    end
  end
end