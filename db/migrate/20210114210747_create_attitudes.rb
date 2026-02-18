class CreateAttitudes < ActiveRecord::Migration[6.0]
  def change
    create_table :attitudes do |t|
      t.string :name
      t.integer :post_id
      t.integer :attitude_id
      t.integer :thing_id
    end
  end
end
