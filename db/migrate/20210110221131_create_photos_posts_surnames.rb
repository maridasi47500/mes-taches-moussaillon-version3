class CreatePhotosPostsSurnames < ActiveRecord::Migration[6.0]
  def change
    create_table :photos_posts_surnames do |t|
      t.integer :person_id
      t.integer :posts_surname_id
    end
  end
end
