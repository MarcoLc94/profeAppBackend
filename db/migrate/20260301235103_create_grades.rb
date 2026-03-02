class CreateGrades < ActiveRecord::Migration[7.1]
  def change
    create_table :grades do |t|
      t.float :score
      t.text :comment
      t.references :student, null: false, foreign_key: true
      t.references :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
