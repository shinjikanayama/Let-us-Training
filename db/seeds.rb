# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.find_or_create_by!(email: "zzz@zzz") do |user|
  user.name = "admin"
  user.password = ENV['DB_PASSWORD_ADMIN']
  user.admin = true
end


User.find_each do |user|
  Genre.find_or_create_by!(name: "胸トレ",user_id: user.id)
  Genre.find_or_create_by!(name: "背中トレ",user_id: user.id)
  Genre.find_or_create_by!(name: "足トレ",user_id: user.id)
  Genre.find_or_create_by!(name: "肩トレ",user_id: user.id)
  Genre.find_or_create_by!(name: "その他",user_id: user.id)
end
