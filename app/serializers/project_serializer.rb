class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :status, :deadline, :owner
  has_many :users
  has_many :entries
end
