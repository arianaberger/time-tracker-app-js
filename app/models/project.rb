class Project < ApplicationRecord
  belongs_to :client
  has_many :entries
  has_many :users, through: :entries

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

