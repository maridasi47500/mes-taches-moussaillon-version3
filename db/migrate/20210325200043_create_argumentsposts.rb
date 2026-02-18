class CreateArgumentsposts < ActiveRecord::Migration[6.0]
  def change
    create_table :argumentsposts do |t|
      t.integer :argument_id
      t.integer :post_id
    end
  end
end
