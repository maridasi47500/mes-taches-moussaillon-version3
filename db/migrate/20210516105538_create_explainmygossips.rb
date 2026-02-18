class CreateExplainmygossips < ActiveRecord::Migration[6.0]
  def change
    create_table :explainmygossips do |t|
      t.integer :aboutsomeonegossip_id
      t.integer :anaphor_id
    end
  end
end
