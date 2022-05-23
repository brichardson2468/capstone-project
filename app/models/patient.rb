class Patient < ApplicationRecord
    has_many :scores
    belongs_to :doctor
end
