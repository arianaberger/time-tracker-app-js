class Project < ApplicationRecord
  has_many :entries
  has_many :entries, through: :tags
  belongs_to :client

  validates :name, presence: true
  validates :status, presence: true

  def statuses
  	[	"Just Started", 
  		"In Progress", 
  		"Almost Complete", 
  		"Complete", 
  		"Total Failure"
  	]
  end


end
