# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ariana = User.create(:name => "Ariana", :title => "CEO", :email => "a@a.com", :password => "pwd")

versace = Client.create(:name => "Versace")
prade = Client.create(:name => "Prada")

kitty_kat = Project.create(:name => "Kitty Kat", :status => "In Progress", :deadline => "Dec 12", :user_id => 1, :client_id => 1)


