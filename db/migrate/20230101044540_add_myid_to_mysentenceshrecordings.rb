class AddMyidToMysentenceshrecordings < ActiveRecord::Migration[6.0]
  def change
    add_column :mysentenceshrecordings, :myid, :integer
  end
end
