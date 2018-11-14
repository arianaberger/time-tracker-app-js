class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :project

  def self.desc_order
  	order(date: :desc)
  end

  def self.latest
 	desc_order.limit(3)
   end

   def calc_time(time)
	time.strftime("%H:%M")    
   end

   def calc_hours(user_or_project)
   	#get the entries.all for each user/project 
   	#iterate over each and get start and end times 
   	#convert each using calc_time and then subtract to get the total time
   	#collect in an array and add together array.sum
   	#add error when creating new time entry that it has to be on the same day??

   	#move method to the user and project models?

   	time_array = array.new
   	user_or_project.entries.each do |entry|
   		time_array << calc_time(entry.start_time).slice[0,1].to_i - calc_time(entry.end_time).slice[0,1].to_i
   	end
   	time_array.sum
   end



end

