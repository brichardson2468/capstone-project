class Doctor < ApplicationRecord
    has_many :appointments
    has_many :patients
    has_many :scores, through: :patients

    has_secure_password
    
end
