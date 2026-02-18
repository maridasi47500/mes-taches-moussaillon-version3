class CreateReactions < ActiveRecord::Migration[6.0]
  def change
    create_table :reactions do |t|
      t.string :name
      t.integer :pronoun_id
    end
  end
end
