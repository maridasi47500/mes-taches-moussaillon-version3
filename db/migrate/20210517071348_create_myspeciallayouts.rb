class CreateMyspeciallayouts < ActiveRecord::Migration[6.0]
  def change
    create_table :myspeciallayouts do |t|
      t.integer :mylayout_id
      t.integer :post_id
    end
  end
end
