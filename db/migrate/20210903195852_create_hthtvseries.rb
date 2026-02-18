class CreateHthtvseries < ActiveRecord::Migration[6.0]
  def change
    create_table :hthtvseries do |t|
      t.integer :tvseries_id
      t.integer :hackertask_id
    end
  end
end
