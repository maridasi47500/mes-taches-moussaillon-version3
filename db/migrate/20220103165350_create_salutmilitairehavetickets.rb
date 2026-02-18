class CreateSalutmilitairehavetickets < ActiveRecord::Migration[6.0]
  def change
    create_table :salutmilitairehavetickets do |t|
      t.integer :salutmilitaire_id
      t.integer :ticket_id
    end
  end
end
