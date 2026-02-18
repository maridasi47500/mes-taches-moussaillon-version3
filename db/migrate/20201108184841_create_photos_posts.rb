class CreatePhotosPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :photos_posts do |t|
      t.integer :photo_id
      t.integer :post_id
    end
    create_table :photos_users do |t|
      t.integer :photo_id
      t.integer :user_id
    end
  end
end
