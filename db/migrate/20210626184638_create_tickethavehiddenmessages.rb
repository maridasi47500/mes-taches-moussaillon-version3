class CreateTickethavehiddenmessages < ActiveRecord::Migration[6.0]
  def change
    create_table :tickethavehiddenmessages do |t|
      t.integer :ticket_id
      t.integer :hiddenmessage_id
    end
  end
end
