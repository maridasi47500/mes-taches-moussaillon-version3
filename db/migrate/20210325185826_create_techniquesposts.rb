class CreateTechniquesposts < ActiveRecord::Migration[6.0]
  def change
    create_table :techniquesposts do |t|
      t.integer :technique_id
      t.integer :post_id
    end
  end
end
