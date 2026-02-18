class CreatePersoncomments < ActiveRecord::Migration[6.0]
  def change
    create_table :personcomments do |t|
      t.integer :person_id
      t.integer :post_id
    end
  end
end
