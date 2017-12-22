class Course < ApplicationRecord
    has_many :enrolls, dependent: :destroy
    has_many :test_courses, dependent: :destroy
    
    validates :year, uniqueness: true, presence: true, numericality: { only_integer: true }, inclusion: {in: 1990..2100,  message: 'debes poner una fecha realista 1990-2100'}
end