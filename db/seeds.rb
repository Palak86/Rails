# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
categories = [
  { name: "skincare"},
  { name: "makeup"},
  { name: "haircare"}
  { name: "personal care"},
  { name: "fragnance"},
  { name: "wellness"}
  { name: "accessories"},
  { name: "mom & baby"},
]
categories.each do |category|
  Category.create(category)
end

Buyer.create(name: 'admin', address: 'sai kripa', phone_number: 7898680620, email: 'patelpalak2517@gmail.com', password: 'password', role: 1)
