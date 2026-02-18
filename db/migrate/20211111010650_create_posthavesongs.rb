class CreatePosthavesongs < ActiveRecord::Migration[6.0]
  def change
    create_table :posthavesongs do |t|
      t.integer :post_id
      t.integer :song_id
    end
  end
end
