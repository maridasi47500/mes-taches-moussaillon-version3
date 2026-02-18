class AddContentknownToTickets < ActiveRecord::Migration[6.0]
  def change
    add_column :tickets, :contentknown, :boolean
  end
end
