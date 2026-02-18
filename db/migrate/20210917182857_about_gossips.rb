class AboutGossips < ActiveRecord::Migration[6.0]
  def change
create_table :likerumeurs do |t|
t.integer :gossip_id
t.integer :user_id
end
create_table :dontlikerumeurs do |t|
t.integer :gossip_id
t.integer :user_id
end
create_table :readrumeurs do |t|
t.integer :gossip_id
t.integer :user_id
end
create_table :heardrumeurs do |t|
t.integer :gossip_id
t.integer :user_id
end
create_table :commentrumeurs do |t|
t.integer :gossip_id
t.integer :user_id
t.text :content
end
create_table :noterumeurs do |t|
t.integer :gossip_id
t.integer :user_id
t.integer :note
end
  end
end
