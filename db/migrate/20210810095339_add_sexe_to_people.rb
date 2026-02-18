class AddSexeToPeople < ActiveRecord::Migration[6.0]
  def change
    add_column :people, :sexe, :string
  end
end
