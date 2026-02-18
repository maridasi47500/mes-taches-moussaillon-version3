class CreatePostsSurnamesReactions < ActiveRecord::Migration[6.0]
  def change
    create_table :posts_surnames_reactions do |t|
      t.integer :posts_surname_id
      t.integer :reaction_id
    end
  end
end
