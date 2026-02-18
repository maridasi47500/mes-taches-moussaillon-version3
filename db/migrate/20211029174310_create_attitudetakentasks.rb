class CreateAttitudetakentasks < ActiveRecord::Migration[6.0]
  def change
    create_table :torealizetasks do |t|
      t.integer :task_id
      t.integer :user_id
    end
    create_table :attitudetakentasks do |t|
      t.integer :torealizetask_id
      t.integer :attitude_id
      t.boolean :real
      t.timestamps
    end
    create_table :stories do |t|
      t.string :title_fr
      t.string :title_en
      t.string :title_de
      t.string :image
      t.integer :user_id
      t.timestamps
    end
    create_table :heroadventures do |t|
      t.integer :story_id
      t.integer :previousstoryevent_id
      t.string :image
      t.string :content_fr
      t.string :content_en
      t.string :content_de
      t.integer :user_id
      t.timestamps
    end
  end
end
