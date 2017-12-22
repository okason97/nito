class CreateTestCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :test_courses do |t|
      t.belongs_to :course, foreign_key: true
      t.belongs_to :test, foreign_key: true, index: true
    end
  end
end
