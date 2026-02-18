class AddNbtimesToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :nbtimes, :integer
  end
end
