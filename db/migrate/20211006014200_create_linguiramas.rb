class CreateLinguiramas < ActiveRecord::Migration[6.0]
  def change
    create_table :linguaramis do |t|
t.integer :user_id
t.timestamps
    end
create_table :linguaramishavephrases do |t|
t.integer :linguarami_id
t.integer :phrase_id
end
  end
end
