class CreateBeautifulpeople < ActiveRecord::Migration[6.0]
  def change
    create_table :beautifulpeople do |t|
      t.integer :person_id
      t.integer :user_id
      t.integer :note
      t.timestamps
    end
  end
end
