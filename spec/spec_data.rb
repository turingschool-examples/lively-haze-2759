def dish_test_data
  @chef = Chef.create!(name: "Ethan")

  @dish1 = @chef.dishes.create!(name: "Basic Breakfast", description: "Scrambled eggs and toast")

  @ingredient1 = Ingredient.create!(name:"eggs", calories: 100)
  @ingredient2 = Ingredient.create!(name:"toast", calories: 150)
  @ingredient3 = Ingredient.create!(name:"mushrooms", calories: 50)

  @dish1.ingredients << @ingredient1
  @dish1.ingredients << @ingredient2
end