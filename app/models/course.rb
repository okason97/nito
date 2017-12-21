class Course < ApplicationRecord
    has_many :enrolls
    has_many :test_courses
end
