class CreateStudents < ActiveRecord::Migration[7.1]
  def change
    create_table :students do |t|
      t.string :names
      t.string :last_names
      t.integer :age
      t.string :sex
      t.float :height
      t.float :weight
      t.string :photo_url
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
