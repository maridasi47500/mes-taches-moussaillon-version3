class CreateSeveralpeople < ActiveRecord::Migration[6.0]
  def change
    create_table :severalpeoplestories do |t|
      t.integer :myid
      t.integer :reaction_id
    end
    create_table :storysentencestoryhavepeople do |t|
      t.integer :severalpeoplestory_id
      t.integer :posts_surname_id
    end
  end
end
