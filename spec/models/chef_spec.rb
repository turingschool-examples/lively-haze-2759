require 'rails_helper'

RSpec.describe Chef, type: :model do

  describe "validations" do
      it {should validate_presence_of :name}
  end

  describe "relationships" do
      it {should have_many :dishes}
      it {should have_many(:ingredients).through(:dishes)}
  end

  describe "instance methods" do
    before :each do
      @chef_1 = Chef.create!(name: "Scarpano")
      @chef_2 = Chef.create!(name: "Janayah")
  
      @dish_1 = @chef_1.dishes.create!(name: "Pasta Alfredo", description: "Featuring locally cultivated cheeses")
      @dish_2 = @chef_1.dishes.create!(name: "Shrimp Scampi", description: "Fresh seafood with a bright lemon zest")
      @dish_3 = @chef_2.dishes.create!(name: "Lasagna", description: "Stacked layers of cheesey lasagna")
      @dish_4 = @chef_2.dishes.create!(name: "Chicken Parm", description: "Delicious chicken parm with home made marinara")
      @dish_5 = @chef_2.dishes.create!(name: "Mozz Sticks", description: "Gooey mozz sticks")
      @dish_6 = @chef_2.dishes.create!(name: "Grilled cheese", description: "Perfectly toasted grilled cheese")
      
      @ingredient_1 = Ingredient.create!(name: "Cheese", calories: 350)
      @ingredient_2 = Ingredient.create!(name: "Noodles", calories: 275)
      @ingredient_3 = Ingredient.create!(name: "Marinara", calories: 250)
      @ingredient_4 = Ingredient.create!(name: "Chicken", calories: 200)
      @ingredient_5 = Ingredient.create!(name: "Butter", calories: 150)
      @ingredient_6 = Ingredient.create!(name: "Salt", calories: 40)
      @ingredient_7 = Ingredient.create!(name: "Spices", calories: 20)
  
      @dish_ingredient_1 = DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredient_1.id)
      @dish_ingredient_2 = DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredient_2.id)
      @dish_ingredient_3 = DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @ingredient_2.id)

      @dish_ingredient_4 = DishIngredient.create!(dish_id: @dish_3.id, ingredient_id: @ingredient_3.id)
      @dish_ingredient_5 = DishIngredient.create!(dish_id: @dish_4.id, ingredient_id: @ingredient_4.id)
      @dish_ingredient_6 = DishIngredient.create!(dish_id: @dish_4.id, ingredient_id: @ingredient_5.id)
      @dish_ingredient_7 = DishIngredient.create!(dish_id: @dish_4.id, ingredient_id: @ingredient_6.id)
      @dish_ingredient_8 = DishIngredient.create!(dish_id: @dish_4.id, ingredient_id: @ingredient_7.id)
      @dish_ingredient_9 = DishIngredient.create!(dish_id: @dish_3.id, ingredient_id: @ingredient_7.id)
      @dish_ingredient_10 = DishIngredient.create!(dish_id: @dish_3.id, ingredient_id: @ingredient_6.id)
      @dish_ingredient_11 = DishIngredient.create!(dish_id: @dish_3.id, ingredient_id: @ingredient_5.id)
      @dish_ingredient_12 = DishIngredient.create!(dish_id: @dish_5.id, ingredient_id: @ingredient_7.id)
      @dish_ingredient_13 = DishIngredient.create!(dish_id: @dish_5.id, ingredient_id: @ingredient_6.id)
      @dish_ingredient_13 = DishIngredient.create!(dish_id: @dish_6.id, ingredient_id: @ingredient_6.id)
    end

    it "can return a unique list of all ingredients used by the chef" do
      expect(@chef_1.distinct_ingredients).to eq([@ingredient_1, @ingredient_2])
    end

    it "can return the chefs top 3 ingredients" do
      expect(@chef_2.top_ingredients).to eq([@ingredient_6, @ingredient_7, @ingredient_5])
    end
  end
end
