class CreatePostsVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :posts_videos do |t|
      t.integer :post_id
      t.integer :video_id
    end
  end
end
