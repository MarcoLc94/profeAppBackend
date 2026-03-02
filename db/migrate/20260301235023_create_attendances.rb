class CreateAttendances < ActiveRecord::Migration[7.1]
  def change
    create_table :attendances do |t|
      t.date :date
      t.time :time
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
