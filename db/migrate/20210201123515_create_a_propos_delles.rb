class CreateAProposDelles < ActiveRecord::Migration[6.0]
  def change
    create_table :a_propos_delles do |t|
      t.integer :person_id
      t.integer :post_id
    end
  end
end
