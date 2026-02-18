class CreateWorktwo < ActiveRecord::Migration[6.0]
  def change
    create_table :worktwos do |t|
      t.integer :person_id
      t.integer :otherperson_id
      t.string :link
    end

  end
end
