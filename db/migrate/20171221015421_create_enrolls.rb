class CreateEnrolls < ActiveRecord::Migration[5.1]
  def change
    create_table :enrolls do |t|
      t.belongs_to :student, foreign_key: true, index: true
      t.belongs_to :course, foreign_key: true, index: true
    end
  end
end
