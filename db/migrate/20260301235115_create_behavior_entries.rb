class CreateBehaviorEntries < ActiveRecord::Migration[7.1]
  def change
    create_table :behavior_entries do |t|
      t.string :behavior_type
      t.text :description
      t.date :date
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
