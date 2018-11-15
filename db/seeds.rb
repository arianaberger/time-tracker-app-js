# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

karl = User.create!(:name => "Karl Lagerfeld", :email => "kl@kl.com", :password => "pwd", :password_confirmation => "pwd")
kitty = User.create!(:name => "Kitty", :email => "k@k.com", :password => "pwd", :password_confirmation => "pwd")
stella = User.create!(:name => "Stella McCartney", :email => "s@s.com", :password => "pwd", :password_confirmation => "pwd")


hipster = Project.create(:name => "Hipster Fashion Show", :status => "In Progress", :deadline => "Dec 12", :owner => 3)
couture = Project.create(:name => "Couture Fashion Show", :status => "Just Started", :deadline => "Nov 22", :owner => 1)
kat = Project.create(:name => "Kitty Kat Fashion Show", :status => "Just Started", :deadline => "Sep 22", :owner => 2)
space = Project.create(:name => "Space Fashion Show", :status => "In Progress", :deadline => "Nov 15", :owner => 1)

entry_1 = Entry.create(:date => "Sep 25", :start_time => "09:00", :end_time => "14:00", :notes => "Drew sketches for sack bag", :project_id => 1, :user_id => 1)
entry_2 = Entry.create(:date => "Sep 26", :start_time => "15:00", :end_time => "17:00", :notes => "Sewed together the sack bag", :project_id => 1, :user_id => 1)
entry_3 = Entry.create(:date => "Sep 27", :start_time => "10:00", :end_time => "16:00", :notes => "Made models practice runway walk in sack bag", :project_id => 1, :user_id => 1)

entry_4 = Entry.create(:date => "Oct 1", :start_time => "10:00", :end_time => "16:00", :notes => "Stiched up kitty dresses", :project_id => 3, :user_id => 2)
entry_5 = Entry.create(:date => "Oct 2", :start_time => "15:00", :end_time => "17:00", :notes => "Fitted kitties for high heels", :project_id => 3, :user_id => 2)
entry_6 = Entry.create(:date => "Oct 3", :start_time => "09:00", :end_time => "15:00", :notes => "Kitties failed at walking in straight line down runway", :project_id => 3, :user_id => 2)

entry_7 = Entry.create(:date => "Nov 1", :start_time => "10:00", :end_time => "16:00", :notes => "Bought flannel shirts from thrift stores", :project_id => 1, :user_id => 3)
entry_8 = Entry.create(:date => "Nov 2", :start_time => "09:00", :end_time => "13:00", :notes => "Gave all models bowl cuts", :project_id => 1, :user_id => 3)
entry_9 = Entry.create(:date => "Nov 3", :start_time => "11:00", :end_time => "17:00", :notes => "Added moss broaches to flannel shirts", :project_id => 1, :user_id => 3)

entry_10 = Entry.create(:date => "Nov 1", :start_time => "12:00", :end_time => "14:00", :notes => "Trained kitties to not pee on runway", :project_id => 3, :user_id => 1)
entry_11 = Entry.create(:date => "Nov 2", :start_time => "09:00", :end_time => "13:00", :notes => "Vacuumed kitty hair off of runway", :project_id => 3, :user_id => 1)
entry_12 = Entry.create(:date => "Nov 3", :start_time => "11:00", :end_time => "17:00", :notes => "Sewed up couture mouse toys with sparkles", :project_id => 3, :user_id => 1)

entry_13 = Entry.create(:date => "Nov 12", :start_time => "08:00", :end_time => "14:00", :notes => "Fitted models for couture astronaut suits", :project_id => 4, :user_id => 1)
entry_14 = Entry.create(:date => "Nov 13", :start_time => "10:00", :end_time => "13:00", :notes => "Trained Mars rover to walk down runway", :project_id => 4, :user_id => 1)
entry_15 = Entry.create(:date => "Nov 14", :start_time => "12:00", :end_time => "16:00", :notes => "Practiced walking down runway in a vacuum", :project_id => 4, :user_id => 1)
entry_16 = Entry.create(:date => "Nov 15", :start_time => "12:00", :end_time => "13:00", :notes => "Lunch call with NASA to get date for moon photoshoot", :project_id => 4, :user_id => 3)
entry_16 = Entry.create(:date => "Nov 15", :start_time => "12:00", :end_time => "13:00", :notes => "Interstellar sequins added to evening gown", :project_id => 4, :user_id => 3)
