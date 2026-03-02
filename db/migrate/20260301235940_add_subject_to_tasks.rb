class AddSubjectToTasks < ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :subject, :string
  end
end
