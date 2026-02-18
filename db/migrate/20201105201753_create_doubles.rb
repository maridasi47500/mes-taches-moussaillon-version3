class CreateDoubles < ActiveRecord::Migration[6.0]
  def change
    create_table :doubles do |t|
      t.integer :person_id
      t.integer :post_id
    end
  end
end
