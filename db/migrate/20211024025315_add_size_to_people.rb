class AddSizeToPeople < ActiveRecord::Migration[6.0]
  def change
    add_column :people, :size, :integer
  end
end
