class AddEventIdToAdditionaltasks < ActiveRecord::Migration[6.0]
  def change
    add_column :additionaltasks, :event_id, :integer
  end
end
