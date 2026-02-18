class CreateCouplethavecomposedcontent < ActiveRecord::Migration[6.0]
  def change
    create_table :couplethavecomposedcontents do |t|
      t.integer :composedcontent_id
      t.integer :couplet_id
      t.integer :user_id
    end
    create_table :refrainhavecomposedcontents do |t|
      t.integer :composedcontent_id
      t.integer :refrain_id
      t.integer :user_id
    end
  end
end
