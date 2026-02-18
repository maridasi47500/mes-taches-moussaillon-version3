class AddJingleIdToPostsRecordings < ActiveRecord::Migration[6.0]
  def change
    add_column :posts_recordings, :jingle_id, :string
  end
end
