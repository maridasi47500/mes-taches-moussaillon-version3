class CreatePhotoshavethings < ActiveRecord::Migration[6.0]
  def change
    create_table :photoshavethings do |t|
      t.integer :photo_id
      t.integer :thing_id
    end
  end
end
