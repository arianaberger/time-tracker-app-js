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

   def calc_hours
   end



end

