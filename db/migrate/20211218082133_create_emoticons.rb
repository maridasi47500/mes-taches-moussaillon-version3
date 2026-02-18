class CreateEmoticons < ActiveRecord::Migration[6.0]
  def change
    create_table :emoticons do |t|
      t.string :title
      t.string :image
      t.timestamps
    end
    create_table :reactiontrueimages do |t|
      t.integer :user_id
      t.integer :reactionpic_id
      t.integer :post_id
      t.integer :posts_surname_id
    end
    create_table :reactionimages do |t|
      t.integer :user_id
      t.integer :person_id
      t.integer :reactionpic_id
      t.integer :post_id
      t.integer :posts_surname_id
    end
  end
end
