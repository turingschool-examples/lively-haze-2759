require 'rails_helper'

RSpec.describe Dish, type: :model do

  describe "validations" do
      it {should validate_presence_of :name}
      it {should validate_presence_of :description}
  end

  describe "relationships" do
      it {should belong_to :chef}
      it {should have_many :dish_ingredients}
      it {should have_many :ingredients}
  end

  describe "model tests" do

    before do
      @wakako = Chef.create!(name: "Wakako Okada")
      @ramen = @wakako.dishes.create!(name: "Ramen", description: "A comforting and easy to make ramen!")
      @ramen.ingredients.create!(name: "Chicken Breasts", calories: 231)
      @ramen.ingredients.create!(name: "Ginger", calories: 9)
      @ramen.ingredients.create!(name: "Sesame Oil", calories: 120)
      @ramen.ingredients.create!(name: "Garlic", calories: 5)
      @ramen.ingredients.create!(name: "Mirin", calories: 35)
      @ramen.ingredients.create!(name: "Chicken Stock", calories: 86)
      @ramen.ingredients.create!(name: "Ramen Wheat Noodles", calories: 200)
    end

    it "totals calories for the dish" do
      expect(@ramen.total_calories).to eq(686)
    end
  end


end