class CreatePeoplehavebacseries < ActiveRecord::Migration[6.0]
  def change
    create_table :peoplehavebacseries do |t|
      t.integer :person_id
      t.integer :bacseries_id
    end
  end
end
