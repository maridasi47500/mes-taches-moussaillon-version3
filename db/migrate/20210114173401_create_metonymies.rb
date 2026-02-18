class CreateMetonymies < ActiveRecord::Migration[6.0]
  def change
    create_table :metonymies do |t|
      t.string :name
      t.integer :post_id
      t.integer :metonymy_id
      t.integer :thing_id
    end
  end
end
