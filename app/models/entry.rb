class Entry < ApplicationRecord
  belongs_to :project
  belongs_to :tags
  has_many :projects, through: :tags

  def self.desc_order
  	order(date: :desc)
  end

  def self.latest
 	desc_order.limit(2)
   end

end
