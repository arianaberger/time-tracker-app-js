class Project < ApplicationRecord
  has_many :entries
  has_many :users, through: :entries

  validates :name, presence: true

  # include FormatDate::InstanceMethods

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

#I want to move this into a module/concern:
   def calc_date(date)
    date.strftime("%b %d, %Y")
   end

end

