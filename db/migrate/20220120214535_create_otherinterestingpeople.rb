class CreateOtherinterestingpeople < ActiveRecord::Migration[6.0]
  def change
    create_table :otherinterestingpeople do |t|
      t.integer :posts_surname_id
      t.integer :other_posts_surname_id
    end
    create_table :otherinterestingcouples do |t|
      t.integer :linkspouseperson_id
      t.integer :otherlinkspouseperson_id
    end
  end
end
