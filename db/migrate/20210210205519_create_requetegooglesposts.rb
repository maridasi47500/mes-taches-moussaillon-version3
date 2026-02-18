class CreateRequetegooglesposts < ActiveRecord::Migration[6.0]
  def change
    create_table :requetegooglesposts do |t|
      t.integer :google_id
      t.integer :post_id
    end
  end
end
