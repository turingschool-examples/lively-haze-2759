require 'rails_helper'

RSpec.describe Chef, type: :model do
  before :each do
    @chef_1 = Chef.create!(name: "That One Guy")
      
    @spaget = @chef_1.dishes.create!(name: "Noodles", description: "very good much wow")
    @steak = @chef_1.dishes.create!(name: "Steak", description: "mmmmm")
    
    @sauce = Ingredient.create!(name: "Tomato Sauce", calories: 1234)
    @carrot = Ingredient.create!(name: "Carrots", calories: 12)
    @beef = Ingredient.create!(name: "Beef", calories: 321)
  
    @mash = Ingredient.create!(name: "Mashed Potatos", calories: 400)
    
    @spaget.ingredients << @sauce
    @spaget.ingredients << @carrot
    @spaget.ingredients << @beef
    @steak.ingredients << @mash

  end
  
  describe "validations" do
      it {should validate_presence_of :name}
  end

  describe "relationships" do
      it {should have_many :dishes}
  end

  describe "#instance_methods" do 
    describe "#ingredients_list" do 
      it "returns all ingredients in every dish the chef cooked" do
        expect(@chef_1.ingredient_list.first.name).to eq(@sauce.name)
        expect(@chef_1.ingredient_list.second.name).to eq(@carrot.name)
        expect(@chef_1.ingredient_list.third.name).to eq(@beef.name)
        expect(@chef_1.ingredient_list.last.name).to eq(@mash.name)
      end
    end
  end
end