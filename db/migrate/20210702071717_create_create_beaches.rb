class CreateCreateBeaches < ActiveRecord::Migration[6.0]
  def change
    create_table :beaches do |t|
      t.integer :address_id
      t.string :name

      t.timestamps
    end
    create_table :beacheshaveaidememoires do |t|
      t.integer :beach_id
      t.integer :aidememoire_id

      t.timestamps
    end
  end
end
