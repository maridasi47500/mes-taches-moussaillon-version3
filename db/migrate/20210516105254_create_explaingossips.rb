class CreateExplaingossips < ActiveRecord::Migration[6.0]
  def change
    create_table :explaingossips do |t|
      t.integer :fromsomeonegossip_id
      t.integer :anaphor_id
    end
  end
end
