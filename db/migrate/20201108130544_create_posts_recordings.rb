class CreatePostsRecordings < ActiveRecord::Migration[6.0]
  def change
    create_table :posts_recordings do |t|
      t.integer :post_id
      t.integer :recording_id
    end
  end
end
