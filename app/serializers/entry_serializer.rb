class EntrySerializer < ActiveModel::Serializer
  attributes :id, :start_time, :end_time, :notes, :project, :date, :user
  belongs_to :project
  belongs_to :user
end
