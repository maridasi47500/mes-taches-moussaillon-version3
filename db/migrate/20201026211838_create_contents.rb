class CreateContents < ActiveRecord::Migration[6.0]
  def change
    create_table :contents do |t|
      t.string :type
      t.string :content
      t.integer :other_data_id

      t.timestamps
    end
  end
end
