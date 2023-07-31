require "rails_helper"


RSpec.describe "Dish Show Page" do
  before :each do
    @chef_1 = Chef.create!("Anna")
    @chef_2 = Chef.create!("Justin")
    @chef_3 = Chef.create!("Luca")
    @dish_1 = @chef_1.dishes.create!(name: "salad", description: "This is a salad.")
    @dish_2 = @chef_1.dishes.create!(name: "wings", description: "These are wings.")
    @dish_3 = @chef_1.dishes.create!(name: "pizza", description: "This is a pizza.")
    @ingredient_1 = Ingredient.create!(name: "cheese", calories: 400)
    @ingredient_2 = Ingredient.create!(name: "chicken", calories: 350)
    @ingredient_3 = Ingredient.create!(name: "lettuce", calories: 50)
    @ingredient_4 = Ingredient.create!(name: "tomato", calories: 90)
    @ingredient_5 = Ingredient.create!(name: "flour", calories: 150)
    @ingredient_6 = Ingredient.create!(name: "oil", calories: 250)
    @dish_ingredient_1 = DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredient_1.id)
    @dish_ingredient_2 = DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredient_3.id)
    @dish_ingredient_3 = DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredient_4.id)
    @dish_ingredient_4 = DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @ingredient_2.id)
    @dish_ingredient_5 = DishIngredient.create!(dish_id: @dish_3.id, ingredient_id: @ingredient_1.id)
    @dish_ingredient_6 = DishIngredient.create!(dish_id: @dish_3.id, ingredient_id: @ingredient_4.id)
    # @dish_ingredient_7 = DishIngredient.create!(dish_id: , ingredient_id: )
    # @dish_ingredient_8 = DishIngredient.create!(dish_id: , ingredient_id: )
    # @dish_ingredient_1 = DishIngredient.create!(dish_id: , ingredient_id: )

    visit 
  end
  it "displays the dish's name and description"
end