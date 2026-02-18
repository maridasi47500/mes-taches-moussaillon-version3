class AddTypeToRecordings < ActiveRecord::Migration[6.0]
  def change
    add_column :recordings, :type, :string
  end
end
