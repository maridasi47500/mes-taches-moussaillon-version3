class CreateJingleshavereactions < ActiveRecord::Migration[6.0]
  def change
    create_table :jingleshavereactions do |t|
      t.integer :jingle_id
      t.integer :reaction_id
    end
  end
end
