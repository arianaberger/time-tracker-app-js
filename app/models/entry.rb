class Entry < ApplicationRecord
  belongs_to :project
  belongs_to :user

  def self.desc_order
  	order(created_at: :asc)
  end

end
