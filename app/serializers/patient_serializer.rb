class PatientSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :DOB, :doctor_id
end
