class Student < ApplicationRecord
    has_many :enrolls
    has_many :scores

    def self.left_join_enrolls course
        sql = ("LEFT JOIN 
            (SELECT * 
            FROM enrolls 
            WHERE "+ sanitize_sql(["enrolls.course_id = ?", course]) + ") as e 
                ON e.student_id = students.id") 
        self.select("students.*, e.*").joins(sql)
    end
end
