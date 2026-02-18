class CreateTaskhasmanygossips < ActiveRecord::Migration[6.0]
  def change
    create_table :taskhasmanygossips do |t|
      t.integer :aboutsomeonegossip_id
      t.integer :task_id
    end
  end
end
