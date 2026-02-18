class CreateFakecomenttable < ActiveRecord::Migration[6.0]
  def change
    create_table :fakecomenttables do |t|
      t.integer :fakecomment_id
      t.integer :post_id
    end
  end
end
