class AddLastnameToPeople < ActiveRecord::Migration[6.0]
  def change
    add_column :people, :lastname, :string
    add_column :people, :firstnames, :string
  end
end
