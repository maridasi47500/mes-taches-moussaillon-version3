class CreateDisplaygossip < ActiveRecord::Migration[6.0]
  def change
    create_table :displaygossips do |t|
      t.integer :Gossipid
      t.integer :Postid
      t.string :Display
    end
  end
end
