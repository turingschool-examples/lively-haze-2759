require 'rails_helper'

RSpec.describe Chef, type: :model do
  before :each do
    load_test_data
  end

  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it { should have_many :dishes }
  end

  describe 'instance methods' do
    it '#unique_ingredients' do
      unique_ingredients = @chef1.unique_ingredients

      expect(unique_ingredients).to all(be_an Ingredient)
      expect(unique_ingredients).to contain_exactly(@ingredient1, @ingredient2, @ingredient3, @ingredient4)
    end
  end
end
