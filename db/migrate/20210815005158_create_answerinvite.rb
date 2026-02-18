class CreateAnswerinvite < ActiveRecord::Migration[6.0]
  def change
    create_table :answerinvites do |t|
      t.integer :invite_id
      t.integer :person_id
      t.text :content
    end
  end
end
