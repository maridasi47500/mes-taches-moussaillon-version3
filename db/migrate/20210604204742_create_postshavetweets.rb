class CreatePostshavetweets < ActiveRecord::Migration[6.0]
  def change
    create_table :postshavetweets do |t|
      t.integer :post_id
      t.integer :tweet_id
    end
  end
end
