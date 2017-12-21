class CreateTeachers < ActiveRecord::Migration[5.1]
  def change
    create_table :teachers do |t|
      t.string :username, null: false, limit: 64
      t.string :password, null: false, limit: 64
    end
  end
end
