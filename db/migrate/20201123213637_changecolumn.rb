class Changecolumn < ActiveRecord::Migration[6.0]
  def change
change_column :events_people, :person_id, :integer
  end
end
