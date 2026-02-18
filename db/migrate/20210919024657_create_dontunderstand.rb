class CreateDontunderstand < ActiveRecord::Migration[6.0]
  def change
    create_table :dontunderstandgossips do |t|
t.integer :gossip_id
t.integer :user_id
    end
  end
end
