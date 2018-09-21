class Project < ApplicationRecord
  has_many :entries

  validates :name, presence: true
  validates :status, presence: true

end
