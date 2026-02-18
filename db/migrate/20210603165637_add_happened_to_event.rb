class AddHappenedToEvent < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :happened, :boolean
  end
end
