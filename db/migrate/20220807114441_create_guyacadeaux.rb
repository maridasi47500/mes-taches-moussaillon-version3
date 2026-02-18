class CreateGuyacadeaux < ActiveRecord::Migration[6.0]
  def change
    create_table :guyacadeaux do |t|
      t.string :type
      t.integer :price
      t.integer :person_id
      t.integer :address_id
	t.timestamps
    end
  end
end
