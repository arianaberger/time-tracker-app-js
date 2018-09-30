class Entry < ApplicationRecord
  belongs_to :project
  belongs_to :user

  def self.desc_order
  	order(date: :desc)
  end

end
