class CreateInvite < ActiveRecord::Migration[6.0]
  def change
    create_table :invites do |t|
      t.string :namegroup
      t.string :vipassname
      t.string :image
    end
  end
end
