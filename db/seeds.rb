# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

40.times do |i|
    Shop.create(
        name: Faker::Name.name,
        description: Faker::Name.name,
        sweet_line: "Hello baby",
        logo: "....",
        user_id: 8
    )
end 