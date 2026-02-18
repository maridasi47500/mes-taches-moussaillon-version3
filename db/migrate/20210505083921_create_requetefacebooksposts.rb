class CreateRequetefacebooksposts < ActiveRecord::Migration[6.0]
  def change
    create_table :requetefacebooksposts do |t|
      t.integer :facebook_request_id
      t.integer :post_id
    end
  end
end
