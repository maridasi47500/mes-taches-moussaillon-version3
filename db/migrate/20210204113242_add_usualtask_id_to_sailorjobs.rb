class AddUsualtaskIdToSailorjobs < ActiveRecord::Migration[6.0]
  def change
    add_column :sailorjobs, :routine_id, :integer
  end
end
