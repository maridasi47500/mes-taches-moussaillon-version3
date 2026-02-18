class AddCategorythingIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :musicalinstrument_id, :integer
	create_table :someonemusicalinstruments do |t|
		t.integer :city_id
		t.integer :musicalinstrumentshaveplayer_id
	end
  end
end
