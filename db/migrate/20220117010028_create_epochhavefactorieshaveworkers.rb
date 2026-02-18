class CreateEpochhavefactorieshaveworkers < ActiveRecord::Migration[6.0]
  def change
    create_table :epochhavefactorieshaveworkers do |t|
      t.integer :epoch_id
      t.integer :factorieshaveworker_id
    end
  end
end
