class Doctor < ApplicationRecord
    has_many :appointments
    has_many :patients
    has_many :scores, through: :patients
end
