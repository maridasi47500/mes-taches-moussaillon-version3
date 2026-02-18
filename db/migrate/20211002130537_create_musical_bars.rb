class CreateMusicalBars < ActiveRecord::Migration[6.0]
  def change
    create_table :musical_bars do |t|
      t.integer :musicalscore_id
      t.string :image
      t.integer :correct_id
      t.integer :nb, :default => "0"

      t.text :description
    end
  end
end
