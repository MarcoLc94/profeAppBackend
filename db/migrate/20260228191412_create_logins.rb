class CreateLogins < ActiveRecord::Migration[7.1]
  def change
    create_table :logins do |t|
      t.string :phone_number
      t.string :password_digest
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
