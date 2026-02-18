class CreateThreadhavemanyposts < ActiveRecord::Migration[6.0]
  def change
    create_table :threadhavemanyposts do |t|
      t.integer :thread_id
      t.integer :post_id
    end
  end
end
