class CreateCurrentprofilephotos < ActiveRecord::Migration[6.0]
  def change
    create_table :currentprofilephotos do |t|
      t.integer :profilepicture_id
      t.integer :person_id
    end
  end
end
