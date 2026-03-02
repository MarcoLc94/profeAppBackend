class CreateReports < ActiveRecord::Migration[7.1]
  def change
    create_table :reports do |t|
      t.string :title
      t.text :description
      t.date :date
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
