# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
10.times do |n|
  name = Faker::Games::Pokemon.name
  email = Faker::Internet.email
  password = "000000"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               )
end

Label.create([name:'bootstrap', user_id:'1'])
Label.create([name:'apach', user_id:'1'])
Label.create([name:'css', user_id:'2'])
Label.create([name:'rails', user_id:'3'])
Label.create([name:'AR', user_id:'4'])
Label.create([name:'IA', user_id:'5'])
Label.create([name:'php', user_id:'6'])
Label.create([name:'OrO', user_id:'7'])
Label.create([name:'Data', user_id:'8'])
Label.create([name:'gant', user_id:'9'])