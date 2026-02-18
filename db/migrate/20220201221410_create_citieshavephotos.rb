class CreateCitieshavephotos < ActiveRecord::Migration[6.0]
  def change
    create_table :citieshavephotos do |t|
      t.integer :city_id
      t.integer :photo_id
    end
  end
end
