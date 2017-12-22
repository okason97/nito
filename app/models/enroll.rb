class Enroll < ApplicationRecord
    belongs_to :course
    belongs_to :student

    validates_associated :course  
    validates_associated :student
end
