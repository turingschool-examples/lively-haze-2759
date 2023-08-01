require "rails_helper"

RSpec.describe "Chefs" do
  before :each do
    @chef_1 = Chef.create!(name: "Scarpano")
    @chef_2 = Chef.create!(name: "Janayah")

    @dish_1 = @chef_1.dishes.create!(name: "Pasta Alfredo", description: "Featuring locally cultivated cheeses")
    @dish_2 = @chef_1.dishes.create!(name: "Shrimp Scampi", description: "Fresh seafood with a bright lemon zest")
    @dish_3 = @chef_2.dishes.create!(name: "Lasagna", description: "Stacked layers of cheesey lasagna")
    @dish_4 = @chef_2.dishes.create!(name: "Chicken Parm", description: "Delicious chicken parm with home made marinara")
    
    @ingredient_1 = Ingredient.create!(name: "Cheese", calories: 350)
    @ingredient_2 = Ingredient.create!(name: "Noodles", calories: 275)
    @ingredient_3 = Ingredient.create!(name: "Marinara", calories: 250)
    @ingredient_4 = Ingredient.create!(name: "Chicken", calories: 200)

    @dish_ingredient_1 = DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredient_1.id)
    @dish_ingredient_2 = DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredient_2.id)
    @dish_ingredient_3 = DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @ingredient_2.id)
    @dish_ingredient_4 = DishIngredient.create!(dish_id: @dish_3.id, ingredient_id: @ingredient_3.id)
    @dish_ingredient_5 = DishIngredient.create!(dish_id: @dish_4.id, ingredient_id: @ingredient_4.id)
  end

  describe "show page" do
    it "has a link to view a list of all ingredients used by chef" do
      visit chef_path(@chef_1)

      within "#Facts" do
        expect(page).to have_content(@chef_1.name)
        click_link("Ingredients")
        expect(current_path).to eq(chef_ingredients_path(@chef_1))
      end

      within "#Ingredients" do
        expect(page).to have_content("#{@chef_1.name}'s Staple Ingredients")
        expect(page).to have_content(@ingredient_1.name)
        expect(page).to have_content(@ingredient_2.name)
        expect(page).to_not have_content(@ingredient_2.name).twice
      end
    end
  end
end