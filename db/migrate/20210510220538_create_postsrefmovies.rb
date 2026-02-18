class CreatePostsrefmovies < ActiveRecord::Migration[6.0]
  def change
    create_table :postsrefmovies do |t|
      t.integer :post_id
      t.integer :movie_id
    end
  end
end
