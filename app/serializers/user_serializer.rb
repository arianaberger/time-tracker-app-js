class UserSerializer < ActiveModel::Serializer
  attributes :name
  has_many :entries
  has_many :projects, through: :entries
end
