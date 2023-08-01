require "rails_helper"


RSpec.describe "Dish Show Page" do
  before :each do
    load_test_data
    visit chef_dish_path(@chef_1, @dish_1)
  end

  it "displays the dish's name and description" do
    save_and_open_page
    expect(page).to have_content(@dish_1.name)
    expect(page).to have_content(@dish_1.description)
  end

  it "displays a list of its ingredients" do
    expect(page).to have_content(@ingredient_1.name)
    expect(page).to have_content(@ingredient_3.name)
    expect(page).to have_content(@ingredient_4.name)
  end

  it "displays total calorie count" do
    expect(page).to have_content("540")
  end

  it "displays the chef's name" do
    expect(page).to have_content("Anna")
  end

  describe "Add Ingredient Form" do
    it "has a field to add an ingredient id and a submission button" do
      expect(page).to have_field(:ingredient_id)
      expect(page).to have_button("Submit")
    end

    describe "successful submission" do
      before :each do
        fill_in "Ingredient", with: "#{@ingredient_6.id}"
        click_button "Submit"
      end

      it "redirects to the dish's show page upon submission" do
        expect(current_path).to eq(chef_dish_path(@chef_1, @dish_1))
      end

      it "displays the new ingredient" do
        expect(page).to have_content(@ingredient_6.name)
      end
    end
  end
end