class AddPersonIdToUsurpations < ActiveRecord::Migration[6.0]
  def change
    add_column :usurpations, :person_id, :integer
  end
end
