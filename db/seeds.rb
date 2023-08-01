
Chef.destroy_all
Dish.destroy_all
Ingredient.destroy_all

chef1 = Chef.create(name: "John Doe")
chef2 = Chef.create(name: "Jane Smith")

ingredient1 = Ingredient.create(name: "Tomato", calories: 25)
ingredient2 = Ingredient.create(name: "Onion", calories: 10)
ingredient3 = Ingredient.create(name: "Chicken", calories: 150)
ingredient4 = Ingredient.create(name: "Garlic", calories: 5)
ingredient5 = Ingredient.create(name: "Rice", calories: 100)

dish1 = Dish.create(name: "Tomato Soup", description: "Delicious tomato soup", chef: chef1)
dish1.ingredients << [ingredient1, ingredient4]

dish2 = Dish.create(name: "Chicken Curry", description: "Spicy chicken curry", chef: chef1)
dish2.ingredients << [ingredient1, ingredient2, ingredient3]

dish3 = Dish.create(name: "Rice Pilaf", description: "Fluffy rice pilaf", chef: chef2)
dish3.ingredients << [ingredient4, ingredient5]

dish4 = Dish.create(name: "Onion Rings", description: "Crispy onion rings", chef: chef2)
dish4.ingredients << [ingredient2]

dish1.ingredients << ingredient5
dish2.ingredients << ingredient5
dish3.ingredients << ingredient1


puts " Data has been seeded!"
