require "rails_helper"

describe "Dish Show page" do
  before(:each) do
    @chef_1 = Chef.create!(name: "Wolfgang Puck")
    @dish_1 = Dish.create!(name: "Chicken Tenders Plate", description: "Smaller portion of the Chicken Tenders Platter. Crispy breaded chicken tenders are a grill and bar classic. Served with choice of dipping sauce. Shown with classic fries.", chef_id: "#{@chef_1.id}")
    @fries_1 = Ingredient.create!(name: "Fries", calories: 400)
    @tenders_sm = Ingredient.create!(name: "Chicken Tenders small", calories: 1080)
    @dish_1.ingredients << @fries_1
    @dish_1.ingredients << @tenders_sm
  end
  describe "As a visitor When I visit a dish's show page" do
    it "I see the dish’s name and description" do
      visit dish_path("#{@dish_1.id}")
      save_and_open_page
      expect(page).to have_content("#{@dish_1.name}")
      expect(page).to have_content("#{@dish_1.description}")
      
    end
    it "And I see a list of ingredients for that dish" do
      visit dish_path("#{@dish_1.id}")
      
      expect(page).to have_content("#{@tenders_sm.name}")
      expect(page).to have_content("#{@fries_1.name}")
    end
    it "and a total calorie count for that dish" do
      visit dish_path("#{@dish_1.id}")
      
      expect(page).to have_content("1480")
    end
    it "And I see the chef's name" do
      visit dish_path("#{@dish_1.id}")
      
      expect(page).to have_content("#{@chef_1.name}")
    end
    
    
  end
end