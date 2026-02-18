class AddIdoitToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :idoit, :boolean
  end
end
