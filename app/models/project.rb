class Project < ApplicationRecord
  has_many :entries
  has_many :users, through: :entries

  validates :name, presence: true

  def statuses
  	[	"Just Started", 
  		"In Progress", 
  		"Almost Complete", 
  		"Complete", 
  		"Total Failure"
  	]
  end

  def self.project_owner(project)
    User.find(project.owner).name
  end


end

