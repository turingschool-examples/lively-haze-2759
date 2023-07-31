require 'rails_helper'

RSpec.describe 'Dishes Index', type: :feature do
  before :each do
    load_test_data
  end

  it 'shows links to welcome, chefs, and ingredients index pages' do
    visit dishes_path
    expect(page).to have_link('Welcome', href: root_path)
    expect(page).to have_link('Dishes', href: dishes_path)
    expect(page).to have_link('Chefs', href: chefs_path)
  end

  it 'shows each dish with a link to its show page' do
    visit dishes_path
    Dish.all.each do |dish|
      expect(page).to have_link(dish.name, href: dish_path(dish))
    end
  end
end
