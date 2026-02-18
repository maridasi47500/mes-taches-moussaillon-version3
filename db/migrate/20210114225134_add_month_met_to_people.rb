class AddMonthMetToPeople < ActiveRecord::Migration[6.0]
  def change
    add_column :people, :month_met, :string
    add_column :people, :year_met, :string
  end
end
