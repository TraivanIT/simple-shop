# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
traivan = Traivan.create!(fullname: "admin", username: "traivan@admin.com", password: "12345678")

20.times do |product|

  Product.create!(
      title: "Product #{product + 1}",
      price: 10,
      description: "product description and product details",
      status: 0,
      traivan_id: Traivan.first.id
    )
end