class TripSerializer < ActiveModel::Serializer
  attributes :id, :start_date, :completion_date
end
