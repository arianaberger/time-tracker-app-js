class Project < ApplicationRecord
  has_many :entries, :dependent => :destroy
  has_many :users, through: :entries

  validates :name, presence: true

  include FormatDate::InstanceMethods

  def statuses
  	[	"Just Started", 
  		"In Progress", 
  		"Almost Finished", 
  		"Complete", 
  		"Total Failure",
      "Losing Money"
  	]
  end

  def self.project_owner(project)
    User.find(project.owner)
  end

  def self.user_projects(user)
    where(owner: user)
  end

end

