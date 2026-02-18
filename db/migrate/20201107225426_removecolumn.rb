class Removecolumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :usurpations, :usurpation_id, :integer
  end
end
