class AddColorhairToPeople < ActiveRecord::Migration[6.0]
  def change
    add_column :people, :colorhair, :string
  end
end
