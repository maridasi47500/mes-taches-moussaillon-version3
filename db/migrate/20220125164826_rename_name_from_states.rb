class RenameNameFromStates < ActiveRecord::Migration[6.0]
  def change
    rename_column :states, :name, :name_fr
    add_column :states, :name_en, :string
    add_column :states, :name_de, :string
  end
end
