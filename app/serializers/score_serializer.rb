class ScoreSerializer < ActiveModel::Serializer
  attributes :id, :result, :date, :category, :patient_id
end
