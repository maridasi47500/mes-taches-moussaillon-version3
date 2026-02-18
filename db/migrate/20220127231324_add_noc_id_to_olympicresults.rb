class AddNocIdToOlympicresults < ActiveRecord::Migration[6.0]
  def change
    add_column :olympicresults, :noc_id, :integer
    add_column :countries, :code, :string
  end
end
