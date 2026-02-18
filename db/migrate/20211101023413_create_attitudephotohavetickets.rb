class CreateAttitudephotohavetickets < ActiveRecord::Migration[6.0]
  def change
    create_table :attitudephotohavetickets do |t|
      t.integer :ticket_id
      t.integer :attitudephoto_id
    end
  end
end
