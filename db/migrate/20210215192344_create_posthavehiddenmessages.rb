class CreatePosthavehiddenmessages < ActiveRecord::Migration[6.0]
  def change
    create_table :posthavehiddenmessages do |t|
      t.integer :post_id
      t.integer :messagecache_id
    end
  end
end
