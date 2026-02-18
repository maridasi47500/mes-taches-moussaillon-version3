class CreateDupontsurnames < ActiveRecord::Migration[6.0]
  def change
    create_table :dupontsurnames do |t|
      t.string :name
      t.timestamps
    end
  end
end
