class CreateInvitehavetasks < ActiveRecord::Migration[6.0]
  def change
    create_table :invitehavetasks do |t|
      t.integer :invite_id
      t.integer :task_id
    end
  end
end
