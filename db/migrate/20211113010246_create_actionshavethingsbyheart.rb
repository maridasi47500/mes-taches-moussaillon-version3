class CreateActionshavethingsbyheart < ActiveRecord::Migration[6.0]
  def change
    create_table :actionshavethingsbyhearts do |t|
      t.integer :taskaction_id
      t.integer :categorything_id
    end
  end
end
