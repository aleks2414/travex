# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

a01= User.create!({:email => "experiencias@intertravex.com", :password => "travex2017", :password_confirmation => "travex2017", :admin => true, :name => "Experiencias Travex" })