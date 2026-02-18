class CreateInvitehavepeople < ActiveRecord::Migration[6.0]
  def change
    create_table :invitehavepeople do |t|
      t.integer :person_id
      t.integer :invite_id
    end
  end
end
