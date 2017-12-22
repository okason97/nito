class Student < ApplicationRecord
    has_many :enrolls, dependent: :destroy
    has_many :scores, dependent: :destroy

    validates :last_name, :first_name, :dni, :email, :legajo, presence: true
    validates :dni, uniqueness: true, numericality: { only_integer: true }
    validates :legajo, uniqueness: true, numericality: { only_integer: true }
    validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i,
    message: :invalid_email }

    def self.left_join_enrolls course
        sql = ("LEFT JOIN 
            (SELECT * 
            FROM enrolls 
            WHERE "+ sanitize_sql(["enrolls.course_id = ?", course]) + ") as e 
                ON e.student_id = students.id") 
        self.select("students.*, e.*").joins(sql)
    end
end
