class Client < ApplicationRecord
  has_many :projects
  has_many :entries, through: :projects
  belongs_to :user

  validates :name, presence: true, uniqueness: true

end
