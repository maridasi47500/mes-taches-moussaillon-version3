class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.string :sender
      t.string :recipient
      t.text :textcontent
      t.boolean :senderknown
      t.boolean :thereissender
      t.boolean :recipientknown
      t.boolean :thereisrecipient
      t.boolean :validated

      t.timestamps
    end
    create_table :ticketshavesenders do |t|
      t.integer :ticket_id
      t.integer :sender_id
      t.integer :recording1_id
      t.integer :recording2_id
      t.integer :relation_id

      t.timestamps
    end
    create_table :ticketshaverecipients do |t|
      t.integer :ticket_id
      t.integer :recipient_id
      t.integer :recording1_id
      t.integer :recording2_id
      t.integer :relation_id
      t.timestamps
    end
    create_table :taskshaveaccomplishments do |t|
      t.integer :task_id
      t.integer :sailor_id
      t.datetime :timeididit
      t.timestamps
    end
    create_table :tasksvalidatetickets do |t|
      t.integer :task_id
      t.integer :ticket_id
      t.timestamps
    end
    create_table :tasksunvalidatetickets do |t|
      t.integer :task_id
      t.integer :ticket_id
      t.timestamps
    end
  end
end
