class CreateAidememoirehavemiddlerelations < ActiveRecord::Migration[6.0]
  def change
    create_table :aidememoirehavemiddlerelations do |t|
      t.integer :relation_id
      t.integer :aidememoire_id
    end
    create_table :aidememoirehavebigrelations do |t|
      t.integer :relation_id
      t.integer :aidememoire_id
    end
  end
end
