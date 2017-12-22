class TestCourse < ApplicationRecord
    belongs_to :course
    belongs_to :test
    def self.of course
        self.where("course_id = ?", course.id)
    end
end
