require 'rails_helper'

RSpec.describe 'Chefs Index' do
  before :each do
    load_test_data
  end

  it 'shows links to welcome, chefs, and ingredients index pages' do
    visit chefs_path
    expect(page).to have_link('Welcome', href: root_path)
    expect(page).to have_link('Dishes', href: dishes_path)
    expect(page).to have_link('Chefs', href: chefs_path)
  end

  it 'shows each chef with a link to its show page' do
    visit chef_path
    Chef.all.each do |chef|
      expect(page).to have_link(chef.name, href: chef_path(chef))
    end
  end
end
