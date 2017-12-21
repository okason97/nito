class Student < ApplicationRecord
    has_many :enrolls
    has_many :scores
end
