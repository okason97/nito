class CreateTests < ActiveRecord::Migration[5.1]
  def change
    create_table :tests do |t|
      t.string :title, null: false, limit: 64
      t.datetime :date, null: false
      t.float :min_score, null: false
      t.float :max_score, null: false
    end
  end
end
