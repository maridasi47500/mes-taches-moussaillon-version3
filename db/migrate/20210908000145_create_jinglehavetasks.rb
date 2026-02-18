class CreateJinglehavetasks < ActiveRecord::Migration[6.0]
  def change
    create_table :jinglehavetasks do |t|
      t.integer :jingle_id
      t.integer :task_id
    end
  end
end
