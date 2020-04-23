# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create a main sample TODO.

user = User.create!(name:  "Example User",
             email: "example@example.com",
             password:              "foobar",
             password_confirmation: "foobar")

second_user = User.create!(name:  "Example User2",
                    email: "example2@example.com",
                    password:              "foobar",
                    password_confirmation: "foobar")

user.projects.create!(name: "For home")
second_user.projects.create!(name: "For office")

5.times do
  name = Faker::Lorem.sentence(word_count: 5)
  user.projects.find_by_name('for home').tasks.create!(name: name)
end

2.times do
  name = Faker::Lorem.sentence(word_count: 5)
  second_user.projects.find_by_name('for office').tasks.create!(name: name)
end




