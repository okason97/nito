class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :last_name, null: false, limit: 64
      t.string :first_name, null: false, limit: 64
      t.string :email, null: false, limit: 64
      t.integer :legajo, null: false, index: true
      t.integer :dni, null: false, index: true
      t.timestamps
    end
  end
end
