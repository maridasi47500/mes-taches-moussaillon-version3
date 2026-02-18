class CreatePeoplePostsSurnames < ActiveRecord::Migration[6.0]
  def change
    create_table :people_posts_surnames do |t|
      t.integer :person_id
      t.integer :posts_surname_id
    end
  end
end
