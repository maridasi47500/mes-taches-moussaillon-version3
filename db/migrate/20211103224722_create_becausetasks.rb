class CreateBecausetasks < ActiveRecord::Migration[6.0]
  def change
    create_table :becausetasks do |t|
      t.integer :task_id
      t.integer :othertask_id
    end
  end
end
