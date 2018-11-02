class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :project

  def self.desc_order
  	order(date: :desc)
  end

  def self.latest
 	desc_order.limit(4)
   end

end

