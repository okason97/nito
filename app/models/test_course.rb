class TestCourse < ApplicationRecord
    belongs_to :course
    belongs_to :test

    validates_associated :course  
    validates_associated :test

    def self.of course
        self.where("course_id = ?", course.id)
    end
end
