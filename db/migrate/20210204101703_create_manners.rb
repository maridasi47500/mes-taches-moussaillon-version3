class CreateManners < ActiveRecord::Migration[6.0]
  def change
    create_table :manners do |t|
      t.integer :event_id
    end
  end
end
