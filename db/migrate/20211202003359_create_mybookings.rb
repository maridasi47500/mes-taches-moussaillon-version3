class CreateMybookings < ActiveRecord::Migration[6.0]
  def change
    create_table :mybookings do |t|
      t.date :from_date
      t.date :to_date
      t.integer :city_id
      t.integer :alias_id
      t.integer :place_id
    end
  end
end
