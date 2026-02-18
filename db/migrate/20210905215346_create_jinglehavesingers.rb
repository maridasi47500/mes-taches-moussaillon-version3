class CreateJinglehavesingers < ActiveRecord::Migration[6.0]
  def change
    create_table :jinglehavesingers do |t|
      t.integer :jingle_id
      t.integer :singer_id
    end
  end
end
