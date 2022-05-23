class AppointmentSerializer < ActiveModel::Serializer
  attributes :id, :date, :doctor_id
end
