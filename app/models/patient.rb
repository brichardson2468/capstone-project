class Patient < ApplicationRecord
    has_many :scores
    belongs_to :doctor

    has_secure_password
end
