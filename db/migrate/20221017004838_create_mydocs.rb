class CreateMydocs < ActiveRecord::Migration[6.0]
  def change
    create_table :mydocs do |t|
      t.string :controller
      t.string :action
      t.text :content
      t.integer :user_id
      t.timestamps
    end
  end
end
