# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ariana = User.create(:name => "Ariana", :title => "CEO", :email => "a@a.com", :password => "pwd")

versace = Client.create(:name => "Versace")
prada = Client.create(:name => "Prada")
burberry = Client.create(:name => "Burberry")

hipster = Project.create(:name => "Hipster Fashion Show", :status => "In Progress", :deadline => "Dec 12", :user_id => 1, :client_id => 1)
couture = Project.create(:name => "Couture Fashion Show", :status => "Just Started", :deadline => "Nov 22", :user_id => 1, :client_id => 2)
kat = Project.create(:name => "Kitty Kat Fashion Show", :status => "Just Started", :deadline => "Sep 22", :user_id => 1, :client_id => 3)
space = Project.create(:name => "Space Fashion Show", :status => "In Progress", :deadline => "Nov 15", :user_id => 1, :client_id => 3)

entry_1 = Entry.create(:date => "Sep 25", :start_time => "09:00", :end_time => "14:00", :notes => "Drew sketches for sack bag", :user_id => 1, :project_id => 1)
entry_2 = Entry.create(:date => "Sep 26", :start_time => "15:00", :end_time => "17:00", :notes => "Sewed together the sack bag", :user_id => 1, :project_id => 1)
entry_3 = Entry.create(:date => "Sep 27", :start_time => "10:00", :end_time => "16:00", :notes => "Made models practice runway walk in sack bag", :user_id => 1, :project_id => 1)

entry_4 = Entry.create(:date => "Oct 1", :start_time => "10:00", :end_time => "16:00", :notes => "Stiched up kitty dresses", :user_id => 1, :project_id => 3)
entry_5 = Entry.create(:date => "Oct 2", :start_time => "15:00", :end_time => "17:00", :notes => "Fitted kitties for high heels", :user_id => 1, :project_id => 3)
entry_6 = Entry.create(:date => "Oct 3", :start_time => "09:00", :end_time => "15:00", :notes => "Kitties failed at walking in straight line down runway", :user_id => 1, :project_id => 3)