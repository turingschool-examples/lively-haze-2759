require "rails_helper"

describe "Dish Show page" do
  before(:each) do
    @chef_1 = Chef.create!(name: "Wolfgang Puck")
    @dish_1 = Dish.create!(name: "Chicken Tenders Plate", description: "Smaller portion of the Chicken Tenders Platter. Crispy breaded chicken tenders are a grill and bar classic. Served with choice of dipping sauce. Shown with classic fries.", chef_id: "#{@chef_1.id}")
    @fries_1 = Ingredient.create!(name: "Fries", calories: 400)
    @tenders_sm = Ingredient.create!(name: "Chicken Tenders small", calories: 1080)
    @house_salad = Ingredient.create!(name: "House Salad", calories: 130)
    @dish_1.ingredients << @fries_1
    @dish_1.ingredients << @tenders_sm
  end
  describe "As a visitor When I visit a dish's show page" do
    describe "User Story 1" do
      it "I see the dish’s name and description" do
        visit dish_path("#{@dish_1.id}")
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
    
    describe "User story 2 add form" do
      it "I see a form to add an existing Ingredient to that Dish" do
        visit dish_path("#{@dish_1.id}")
        #
        expect(page).to have_css("#add_ingredient_form")
      end
      it "When I fill in the form with the ID of an Ingredient that exists in the database And I click Submit Then I am redirected to that dish's show page And I see that ingredient is now listed. " do
        visit dish_path("#{@dish_1.id}")
        fill_in "ingredient_id", with: "#{@house_salad.id}"
        click_button "Submit"
        
        
        expect(current_path).to eq(dish_path("#{@dish_1.id}"))
        expect(page).to have_content("#{@house_salad.name}")
      end
    end
  end
end