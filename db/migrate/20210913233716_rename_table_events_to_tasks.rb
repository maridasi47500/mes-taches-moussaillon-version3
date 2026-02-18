class RenameTableEventsToTasks < ActiveRecord::Migration[6.0]
  def change
rename_table :events, :tasks
  end
end
