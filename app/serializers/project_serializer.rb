class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :status, :deadline, :owner
  has_many :users, through: :entries
  has_many :entries
end

