class EntrySerializer < ActiveModel::Serializer
  attributes :id, :start_time, :end_time, :notes, :project
  belongs_to :project
  belongs_to :user
end
