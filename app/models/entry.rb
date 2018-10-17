class Entry < ApplicationRecord
  belongs_to :project

  def self.desc_order
  	order(date: :desc)
  end

  def self.latest
 	desc_order.limit(2)
   end

end
