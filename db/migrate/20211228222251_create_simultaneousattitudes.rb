class CreateSimultaneousattitudes < ActiveRecord::Migration[6.0]
  def change
    create_table :simultaneousattitudes do |t|
      t.integer :attitudehavefollowera_id
      t.integer :attitudehavefollowerb_id
    end
    create_table :simultaneousprosailorattitudes do |t|
      t.integer :attitudeshavesailora_id
      t.integer :attitudehavefollowerb_id
    end
    create_table :simultaneoussilorattitudes do |t|
      t.integer :attitudeshavesailora_id
      t.integer :attitudeshavesailorb_id
    end
  end
end
