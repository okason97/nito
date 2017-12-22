class Test < ApplicationRecord
    has_one :score
    has_one :test_course
    def self.of course
        self.where("course_id = ?", course)
    end
end
