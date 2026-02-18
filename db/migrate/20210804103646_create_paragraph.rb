class CreateParagraph < ActiveRecord::Migration[6.0]
  def change
    create_table :paragraphs do |t|
      t.string :type
      t.integer :orderid
    end
    create_table :coupletshavecontents do |t|
      t.string :couplet_id
      t.string :content_id
    end
    create_table :refrainshaverefrains do |t|
      t.string :refrain_id
      t.string :content_id
    end
    create_table :songshavecouplets do |t|
      t.integer :couplet_id
      t.integer :song_id
    end
    create_table :songshaverefrain do |t|
      t.integer :refrain_id
      t.integer :song_id
    end
    add_column :contents, :lineid, :integer
  end
end
