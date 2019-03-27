class UserSerializer < ActiveModel::Serializer
  attributes :name
  has_many :entries
  belongs_to :project
end
