class AddFlagiconToNationalities < ActiveRecord::Migration[6.0]
  def change
    add_column :nationalities, :flagicon, :string
  end
end
