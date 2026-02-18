class AddSurnameIdToPhavefilms < ActiveRecord::Migration[6.0]
  def change
    add_column :phavefilms, :surname_id, :integer
  end
end
