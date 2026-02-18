class AddPersonIdToRecordings < ActiveRecord::Migration[6.0]
  def change
    add_column :recordings, :person_id, :integer
  end
end
