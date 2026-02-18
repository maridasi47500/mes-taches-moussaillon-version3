class CreateCitymayors < ActiveRecord::Migration[6.0]
  def change
    create_table :citymayors do |t|
      t.integer :person_id
      t.text :mot
      t.integer :user_id
      t.integer :city_id
      t.timestamps
    end
    create_table :citynews do |t|
      t.integer :city_id
      t.integer :user_id
      t.text :content
      t.timestamps
    end
  end
end
