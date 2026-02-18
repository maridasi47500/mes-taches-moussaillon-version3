class AddNbtimesToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :nbtimes, :integer
  end
end
