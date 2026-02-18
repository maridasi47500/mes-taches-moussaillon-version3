class AddCodeToOlympicevents < ActiveRecord::Migration[6.0]
  def change
    add_column :olympicevents, :code, :string
  end
end
