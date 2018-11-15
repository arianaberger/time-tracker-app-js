class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates :notes, presence: true

  def self.desc_order
  	order(date: :desc)
  end

   def self.latest
   	desc_order.limit(3)
   end

   def calc_time(time)
  	time.strftime("%H:%M")    
   end

#I want to move this into a module/concern:
   def calc_date(date)
    date.strftime("%b %d, %Y")
   end

   def self.sort_by_project(project_id)
    where(project: project_id)
   end

   def self.calc_hours(entries)
     	time_array = []
     	entries.each do |entry|
     	  time_array << entry.hours_to_i(entry.end_time) - entry.hours_to_i(entry.start_time)
      end
     	time_array.sum
   end

   def self.calc_hours_entry(entry)
    entry.hours_to_i(entry.end_time) - entry.hours_to_i(entry.start_time)
  end

   def hours_to_i(time)
    calc_time(time).slice(0,2).to_i
   end

end

