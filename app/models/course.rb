class Course < ApplicationRecord
    has_many :enrolls
    has_many :test_courses
    validates :year, inclusion: {in: 1990..2100,  message: 'debes poner una fecha realista'}
end
