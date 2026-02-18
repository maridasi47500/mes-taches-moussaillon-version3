class CreateTicketsaboutpeople < ActiveRecord::Migration[6.0]
  def change
    create_table :ticketsaboutpeople do |t|
      t.integer :person_id
      t.integer :ticket_id
    end
  end
end
