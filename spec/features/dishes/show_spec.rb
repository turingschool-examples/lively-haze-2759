require "rails_helper"

describe "Dish Show page" do
  before(:each) do
    @dish_1 = Dish.create!(name: "Chicken Tenders Plate", description: "Smaller portion of the Chicken Tenders Platter. Crispy breaded chicken tenders are a grill and bar classic. Served with choice of dipping sauce. Shown with classic fries.")
    @fries_1 = Ingrediant.create!(name: "Fries", calories: 400)
    @tenders_sm = Ingrediant.create!(name: "Chicken Tenders small", calories: 1080)
    @chef_1 = Chef.create!(name: "Wolfgang Puck")
  end
  describe "As a visitor When I visit a dish's show page" do
    it "I see the dish’s name and description" do
      visit dish_show_path
      
      expect(page).to have_content("Chicken Tenders Plate")
      expect(page).to have_content("Smaller portion of the Chicken Tenders Platter. Crispy breaded chicken tenders are a grill and bar classic. Served with choice of dipping sauce. Shown with classic fries.")
      
    end
    it "And I see a list of ingredients for that dish" do
      visit dish_show_path
      
      expect(page).to have_content("#{@tenders_sm}")
      expect(page).to have_content("#{@fries_1}")
    end
    it "and a total calorie count for that dish" do
      visit dish_show_path
      
      expect(page).to have_content("1480")
    end
    it "And I see the chef's name" do
      visit dish_show_path
      
      expect(page).to have_content("#{@chef_1}")
    end
  end
end