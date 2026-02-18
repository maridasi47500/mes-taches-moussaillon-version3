class DropValidatedFromTickets < ActiveRecord::Migration[6.0]
  def change
    add_column :tickets, :message_id, :integer
    create_table :message_for_tickets do |t|
      t.string :content_fr
      t.string :content_en
      t.string :content_de
    end
  end
end
