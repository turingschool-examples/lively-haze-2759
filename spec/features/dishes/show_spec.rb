require 'rails_helper'

RSpec.describe 'Dishes Index' do
  before :each do
    @chef1 = Chef.create(name: 'Gordon Ramsey')
    @chef2 = Chef.create(name: 'Bobby Flay')
    @chef3 = Chef.create(name: 'Guy Fieri')
    @chef4 = Chef.create(name: 'Rachael Ray')

    @dish1 = Dish.create(name: 'Pasta', description: 'Italian dish', chef_id: @chef1.id)
    @dish2 = Dish.create(name: 'Roast Chicken and Potatoes', description: 'American dish', chef_id: @chef1.id)
    @dish3 = Dish.create(name: 'Sweet and Sour Chicken', description: 'Chinese dish', chef_id: @chef2.id)
    @dish4 = Dish.create(name: 'Chicken Parm', description: 'Italian dish', chef_id: @chef2.id)
    @dish5 = Dish.create(name: 'Pizza', description: 'Italian dish', chef_id: @chef3.id)
    @dish6 = Dish.create(name: 'Burger', description: 'American dish', chef_id: @chef3.id)
    @dish7 = Dish.create(name: 'Chicken and Cashews', description: 'Chinese dish', chef_id: @chef4.id)
    @dish8 = Dish.create(name: 'Chicken Tacos', description: 'Mexican dish', chef_id: @chef4.id)

    @ingredient1 = Ingredient.create(name: 'Spaghetti', calories: 100)
    @ingredient2 = Ingredient.create(name: 'Tomato Sauce', calories: 200)
    @ingredient3 = Ingredient.create(name: 'Chicken', calories: 200)
    @ingredient4 = Ingredient.create(name: 'Red Potatoes', calories: 300)
    @ingredient5 = Ingredient.create(name: 'Dough', calories: 100)
    @ingredient6 = Ingredient.create(name: 'Cheese', calories: 200)
    @ingredient7 = Ingredient.create(name: 'Cashews', calories: 200)
    @ingredient8 = Ingredient.create(name: 'Bun', calories: 300)
    @ingredient9 = Ingredient.create(name: 'Tortilla', calories: 400)
    @ingredient10 = Ingredient.create(name: 'Sour Cream', calories: 500)

    DishesIngredient.create(dish_id: @dish1.id, ingredient_id: @ingredient1.id)
    DishesIngredient.create(dish_id: @dish1.id, ingredient_id: @ingredient2.id)
    DishesIngredient.create(dish_id: @dish2.id, ingredient_id: @ingredient3.id)
    DishesIngredient.create(dish_id: @dish2.id, ingredient_id: @ingredient4.id)
    DishesIngredient.create(dish_id: @dish3.id, ingredient_id: @ingredient3.id)
    DishesIngredient.create(dish_id: @dish3.id, ingredient_id: @ingredient5.id)
    DishesIngredient.create(dish_id: @dish3.id, ingredient_id: @ingredient6.id)
    DishesIngredient.create(dish_id: @dish4.id, ingredient_id: @ingredient3.id)
    DishesIngredient.create(dish_id: @dish4.id, ingredient_id: @ingredient2.id)
    DishesIngredient.create(dish_id: @dish4.id, ingredient_id: @ingredient6.id)
    DishesIngredient.create(dish_id: @dish5.id, ingredient_id: @ingredient5.id)
    DishesIngredient.create(dish_id: @dish5.id, ingredient_id: @ingredient6.id)
    DishesIngredient.create(dish_id: @dish6.id, ingredient_id: @ingredient3.id)
    DishesIngredient.create(dish_id: @dish6.id, ingredient_id: @ingredient7.id)
    DishesIngredient.create(dish_id: @dish6.id, ingredient_id: @ingredient8.id)
    DishesIngredient.create(dish_id: @dish7.id, ingredient_id: @ingredient3.id)
    DishesIngredient.create(dish_id: @dish7.id, ingredient_id: @ingredient5.id)
    DishesIngredient.create(dish_id: @dish7.id, ingredient_id: @ingredient8.id)
    DishesIngredient.create(dish_id: @dish8.id, ingredient_id: @ingredient3.id)
    DishesIngredient.create(dish_id: @dish8.id, ingredient_id: @ingredient9.id)
    DishesIngredient.create(dish_id: @dish8.id, ingredient_id: @ingredient10.id)
  end

  # User Story 1:
  #   As a visitor
  # When I visit a dish's show page
  # I see the dish’s name and description
  # And I see a list of ingredients for that dish
  # and a total calorie count for that dish
  # And I see the chef's name.

  it 'shows the name of the chef that made that dish' do
    visit dish_path(@dish1)

    expect(page).to have_content(@dish1.name)
    expect(page).to have_content(@dish1.description)
    expect(page).to have_content(@ingredient1.name)
    expect(page).to have_content(@ingredient2.name)
    expect(page).to have_content(@chef1.name)
    expect(page).to have_content(@dish1.calorie_count)
  end

  it 'does not show the name of the chef that did not make that dish' do
    visit dish_path(@dish1)
    expect(page).to_not have_content(@chef2.name)
  end
end
