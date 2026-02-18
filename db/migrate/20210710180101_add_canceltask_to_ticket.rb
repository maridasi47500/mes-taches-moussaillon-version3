class AddCanceltaskToTicket < ActiveRecord::Migration[6.0]
  def change
    add_column :tickets, :canceltask, :boolean
  end
end
