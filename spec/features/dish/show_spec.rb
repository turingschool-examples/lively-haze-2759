require 'rails_helper' 

RSpec.describe 'Dish Show Page', type: :feature do
    before(:each) do
        load_test_data
    end

    describe 'As a visitor' do
        describe 'Visiting the dishs show page' do
            it 'Shows the name, description, list of all ingredients that dish, total calories and chefs name' do

                visit chef_dish_path(@chef_1, @dish_1) 
                
                expect(page).to have_content(@dish_1.name)
                expect(page).to have_content(@dish_1.description)
                expect(page).to have_content(@ingredient_1.name)
                expect(page).to have_content(@ingredient_2.name)
                expect(page).to have_content(@ingredient_3.name)
                expect(page).to have_content(@dish_1.total_calories)
                expect(page).to have_content(@chef_1.name)

    
            end

            it 'Has a form to add an existing ingredient to the database' do

                visit chef_dish_path(@chef_1, @dish_1)

                within "#add_ingredient" do
                    fill_in :ingredient_id, with: "4"
                    click_button "Submit"
                end

                expect(page).to have_content(@ingredient_4.name)
            end
        end
    end
end

