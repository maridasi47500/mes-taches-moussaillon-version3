class AddTicketIdToTaskshaveaccomplishments < ActiveRecord::Migration[6.0]
  def change
    add_column :taskshaveaccomplishments, :ticket_id, :integer
  end
end
