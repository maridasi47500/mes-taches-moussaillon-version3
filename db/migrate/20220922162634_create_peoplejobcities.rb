class CreatePeoplejobcities < ActiveRecord::Migration[6.0]
  def change
    create_table :peoplejobcities do |t|
      t.integer :peoplehavejob_id
      t.integer :city_id
    end
  end
end
