class DoctorSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :thumbnail, :patients 
end
