class AddSurnameIdToTvserieshaveactors < ActiveRecord::Migration[6.0]
  def change
    add_column :tvserieshaveactors, :surname_id, :integer
  end
end
