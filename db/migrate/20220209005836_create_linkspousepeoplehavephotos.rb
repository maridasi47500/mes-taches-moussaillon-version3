class CreateLinkspousepeoplehavephotos < ActiveRecord::Migration[6.0]
  def change
    create_table :linkspousepeoplehavephotos do |t|
      t.integer :photo_id
      t.integer :linkspouseperson_id
    end
  end
end
