class Score < ApplicationRecord
    belongs_to :test
    belongs_to :student

    validates :value, presence: true
    validates_associated :test  
    validates_associated :student
end
