class AddMeufIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :meuf_id, :integer
    add_column :users, :mec_id, :integer
  end
end
