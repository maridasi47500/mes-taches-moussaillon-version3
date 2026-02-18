class CreateMessagefortasks < ActiveRecord::Migration[6.0]
  def change
    create_table :messagefortasks do |t|
      t.integer :task_id
      t.integer :post_id
    end
  end
end
