class TimeLogSerializer < ActiveModel::Serializer
  belongs_to :project
  attributes :id, :hours, :description, :date, :project
end
