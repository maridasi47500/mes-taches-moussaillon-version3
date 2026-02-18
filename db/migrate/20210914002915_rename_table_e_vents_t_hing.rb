class RenameTableEVentsTHing < ActiveRecord::Migration[6.0]
  def change
rename_table :events_things, :tasks_things
  end
end
