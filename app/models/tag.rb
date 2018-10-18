class Tag < ApplicationRecord
	belongs_to :entry_tags
	has_many :entries, through: :entry_tags 
end
