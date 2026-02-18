class Myjointable < ActiveRecord::Migration[6.0]
  def change
    drop_table :taskshavetaskscollections
    rename_table :collectionshavetasks, :taskshavetaskscollections
  end
end
