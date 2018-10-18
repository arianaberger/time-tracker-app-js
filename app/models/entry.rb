class Entry < ApplicationRecord
  belongs_to :project
  belongs_to :entry_tags
  has_many :tags, through: :entry_tags

  def self.desc_order
  	order(date: :desc)
  end

  def self.latest
 	desc_order.limit(2)
   end

end
