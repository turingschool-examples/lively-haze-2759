require 'rails_helper'

RSpec.describe 'Chef Show Page', type: :feature do
    before(:each) do
        load_test_data
    end

    describe 'As a visitor' do
        describe 'When I visit a chefs show page' do

            it 'Has a link to the chefs ingredients index page' do
                visit chef_path(@chef_1)

                expect(page).to have_link("Ingredients")

                click_link

                expect(current_path).to eq(chef_ingredients_path(@chef_1))

                expect(page).to have_content(@ingredient_1.name)
                expect(page).to have_content(@ingredient_2.name)
                expect(page).to have_content(@ingredient_3.name)
                expect(page).to have_content(@ingredient_4.name)
                expect(page).to have_content(@ingredient_5.name)
                expect(page).to have_content(@ingredient_6.name)
                expect(page).to have_content(@ingredient_7.name)
                expect(page).to have_content(@ingredient_8.name)

            end
        end
    end
end