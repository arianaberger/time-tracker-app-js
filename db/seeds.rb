# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ariana = User.create(:name => "Ariana", :email => "a@a.com", :password => "pwd")
kitty = User.create(:name => "Kitty", :email => "k@k.com", :password => "pwd")

hipster = Project.create(:name => "Hipster Fashion Show", :status => "In Progress", :deadline => "Dec 12", :owner => 1)
couture = Project.create(:name => "Couture Fashion Show", :status => "Just Started", :deadline => "Nov 22", :owner => 1)
kat = Project.create(:name => "Kitty Kat Fashion Show", :status => "Just Started", :deadline => "Sep 22", :owner => 2)
space = Project.create(:name => "Space Fashion Show", :status => "In Progress", :deadline => "Nov 15", :owner => 2)

entry_1 = Entry.create(:date => "Sep 25", :start_time => "09:00", :end_time => "14:00", :notes => "Drew sketches for sack bag", :project_id => 1, :user_id => 1)
entry_2 = Entry.create(:date => "Sep 26", :start_time => "15:00", :end_time => "17:00", :notes => "Sewed together the sack bag", :project_id => 1, :user_id => 1)
entry_3 = Entry.create(:date => "Sep 27", :start_time => "10:00", :end_time => "16:00", :notes => "Made models practice runway walk in sack bag", :project_id => 1, :user_id => 1)

entry_4 = Entry.create(:date => "Oct 1", :start_time => "10:00", :end_time => "16:00", :notes => "Stiched up kitty dresses", :project_id => 3, :user_id => 2)
entry_5 = Entry.create(:date => "Oct 2", :start_time => "15:00", :end_time => "17:00", :notes => "Fitted kitties for high heels", :project_id => 3, :user_id => 2)
entry_6 = Entry.create(:date => "Oct 3", :start_time => "09:00", :end_time => "15:00", :notes => "Kitties failed at walking in straight line down runway", :project_id => 3, :user_id => 2)

entry_7 = Entry.create(:date => "Nov 1", :start_time => "10:00", :end_time => "16:00", :notes => "Bought flannel shirts from thrift stores", :project_id => 1, :user_id => 2)
entry_8 = Entry.create(:date => "Nov 2", :start_time => "09:00", :end_time => "13:00", :notes => "Gave all models bowl cuts", :project_id => 1, :user_id => 2)
entry_9 = Entry.create(:date => "Nov 3", :start_time => "11:00", :end_time => "17:00", :notes => "Added sequins to flannel shirts", :project_id => 1, :user_id => 2)

entry_10 = Entry.create(:date => "Nov 1", :start_time => "2:00", :end_time => "14:00", :notes => "Trained kitties to not pee on runway", :project_id => 3, :user_id => 1)
entry_11 = Entry.create(:date => "Nov 2", :start_time => "09:00", :end_time => "13:00", :notes => "Vacuumed kitty hair off of runway", :project_id => 3, :user_id => 1)
entry_12 = Entry.create(:date => "Nov 3", :start_time => "11:00", :end_time => "17:00", :notes => "Sewed up couture mouse toys with sparkles", :project_id => 3, :user_id => 1)
