class CreateInternetpseudonyms < ActiveRecord::Migration[6.0]
  def change
    create_table :internetpseudonyms do |t| #internet pseudonyms
      t.integer :surname_id
      t.integer :website_id
    end
  end
end
