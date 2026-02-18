class AddDoneToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :done, :boolean
  end
end
