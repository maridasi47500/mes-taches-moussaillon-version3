class CreateRecipients < ActiveRecord::Migration[6.0]
  def change
    create_table :recipients do |t|
      t.integer :person_id
      t.integer :post_id
    end
  end
end
