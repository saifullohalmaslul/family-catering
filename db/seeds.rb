# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

categories = Category.create([{ name: "Indonesian" }, { name: "Breakfast" }])
nasi_uduk = MenuItem.create(name: "Nasi Uduk", price: 10_000.0, description: "Some description here", categories: categories)

orange_juice = MenuItem.create(name: "Orange Juice", price: 12_500.0, description: "Some other description", categories: [Category.create(name: "Beverage")])

Order.create(email: 'me@example.com', menu_items: [nasi_uduk, orange_juice])
