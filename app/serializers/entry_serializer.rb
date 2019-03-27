class EntrySerializer < ActiveModel::Serializer
  attributes :id, :start_time, :end_time, :notes, :project, :date
  belongs_to :project
  belongs_to :user, serializer: UserSerializer
end
