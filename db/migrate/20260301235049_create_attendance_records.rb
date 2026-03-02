class CreateAttendanceRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :attendance_records do |t|
      t.references :student, null: false, foreign_key: true
      t.references :attendance, null: false, foreign_key: true
      t.string :status
      t.boolean :is_justified

      t.timestamps
    end
  end
end
