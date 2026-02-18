class CreateSurnameshavenationalities < ActiveRecord::Migration[6.0]
  def change
    create_table :surnameshaveschools do |t|
      t.integer :school_id
      t.integer :surname_id
    end
    create_table :surnameshavenationalities do |t|
      t.integer :nationality_id
      t.integer :surname_id
    end
  end
end
