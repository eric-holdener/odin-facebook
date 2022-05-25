# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(first_name: "Eric", last_name: "Holdener", email: "eholdener012@gmail.com", password: "123456", username: "Eric")
User.create(first_name: "John", last_name: "Doe", email: "johndoe@gmail.com", password: "123456", username: "BigJD")

Post.create(title: "My first post here!", content: "I'm excited to be working on this facebook clone", user_id: 1)
Post.create(title: "Please Help Me", content: "I don't know who I am", user_id: 2)
