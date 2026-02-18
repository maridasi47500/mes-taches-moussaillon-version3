class AddZoomToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :zoom, :integer 
  end
end
