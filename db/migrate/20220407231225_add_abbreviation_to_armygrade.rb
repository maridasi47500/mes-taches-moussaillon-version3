class AddAbbreviationToArmygrade < ActiveRecord::Migration[6.0]
  def change
    add_column :armygrades, :abbreviation, :string
  end
end
