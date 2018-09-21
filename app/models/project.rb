class Project < ApplicationRecord
  has_many :entries
  belongs_to :client
  belongs_to :user

  validates :name, presence: true
  validates :status, presence: true

end
