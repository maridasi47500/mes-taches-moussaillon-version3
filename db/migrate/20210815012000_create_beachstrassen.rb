class CreateBeachstrassen < ActiveRecord::Migration[6.0]
  def change
    create_table :beachstrassen do |t|
      t.integer :rue_id
      t.integer :beach_id
    end
    create_table :rues do |t|
      t.string :name
    end
  end
end
