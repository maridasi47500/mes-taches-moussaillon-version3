class CreateMymap < ActiveRecord::Migration[6.0]
  def change
    create_table :mymaps do |t|
      t.string :image
      t.string :width
      t.string :height
    end
    create_table :mymapscoords do |t|
      t.string :mymap_id
      t.string :tagx
      t.string :tagy
    end
  end
end
