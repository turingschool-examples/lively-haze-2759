require "rails_helper"

describe "Chef Show page" do
  before(:each) do
    @chef_1 = Chef.create!(name: "Wolfgang Puck")
    @dish_1 = Dish.create!(name: "Chicken Tenders Plate", description: "Smaller portion of the Chicken Tenders Platter. Crispy breaded chicken tenders are a grill and bar classic. Served with choice of dipping sauce. Shown with classic fries.", chef_id: "#{@chef_1.id}")
    @fries_1 = Ingredient.create!(name: "Fries", calories: 400)
    @tenders_sm = Ingredient.create!(name: "Chicken Tenders small", calories: 1080)
    @house_salad = Ingredient.create!(name: "House Salad", calories: 130)
    @dish_1.ingredients << @fries_1
    @dish_1.ingredients << @tenders_sm
  end
  describe "As a visitor When I visit a chef's show page" do
    describe "User Story 3" do
      it "I see a link to view a list of all ingredients that this chef uses in their dishes." do
        visit chef_path(@chef_1.id)
        
        save_and_open_page
        expect(page).to have_link("Show all ingredients")
      end
      it "When I click on that link I'm taken to a chef's ingredients index page and I can see a unique list of names of all the ingredients that this chef uses." do
        visit chef_path(@chef_1.id)
        click_link "Show all ingredients"
        expect(current_path).to eq(chefs_ingredients_path)
        expect(page).to have_content(@fries_1.name)
        expect(page).to have_content(@tenders_sm.name)
      end
    end
  end
end
