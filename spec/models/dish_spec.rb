require 'rails_helper'

RSpec.describe Dish, type: :model do
  before :each do
    load_test_data
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
  end

  describe 'relationships' do
    it { should belong_to :chef }
    it { should have_many :dishes_ingredients }
    it { should have_many(:ingredients).through(:dishes_ingredients) }
  end

  describe '#calorie_count' do
    it '#calorie_count' do
      expect(@dish1.calorie_count).to eq(300)
    end
  end

  describe '#add_ingredient' do
    it 'can add an ingredient to that dish' do
      result = @dish1.add_ingredient(@ingredient3.id)

      expect(result[:success]).to eq(true)
      expect(result[:message]).to eq('Ingredient added successfully')
      expect(@dish1.ingredients).to include(@ingredient3)
    end

    it 'does not add ingredient if it is already in the dish' do
      result = @dish1.add_ingredient(@ingredient1.id)

      expect(result[:success]).to eq(false)
      expect(result[:message]).to eq('This ingredient is already included in the dish')
    end

    it 'does not add ingredient if it does not exist' do
      result = @dish1.add_ingredient(-1)

      expect(result[:success]).to eq(false)
      expect(result[:message]).to eq('This ingredient does not exist')
    end
  end
end
