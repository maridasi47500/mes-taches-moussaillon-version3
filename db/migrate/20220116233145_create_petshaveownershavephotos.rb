class CreatePetshaveownershavephotos < ActiveRecord::Migration[6.0]
  def change
    create_table :petshaveownershavephotos do |t|
      t.integer :photo_id
      t.integer :petshaveowner_id
    end
  end
end
