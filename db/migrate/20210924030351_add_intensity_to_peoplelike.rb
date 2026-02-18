class AddIntensityToPeoplelike < ActiveRecord::Migration[6.0]
  def change
    add_column :peoplelike, :intensity, :integer
    add_column :peopledontlike, :intensity, :integer
  end
end
