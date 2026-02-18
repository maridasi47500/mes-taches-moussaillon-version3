class CreateTickethaveplaces < ActiveRecord::Migration[6.0]
  def change
    create_table :tickethaveplaces do |t|
      t.integer :ticket_id
      t.integer :place_id
    end
  end
end
