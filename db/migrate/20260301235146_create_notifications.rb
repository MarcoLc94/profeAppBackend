class CreateNotifications < ActiveRecord::Migration[7.1]
  def change
    create_table :notifications do |t|
      t.string :title
      t.text :description
      t.datetime :creation_date
      t.datetime :expiration_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
