class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.date :due_date
      t.time :due_time
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
