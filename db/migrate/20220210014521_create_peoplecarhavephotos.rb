class CreatePeoplecarhavephotos < ActiveRecord::Migration[6.0]
  def change
    create_table :peoplecarhavephotos do |t|
      t.integer :peoplecar_id
      t.integer :photo_id
    end
  end
end
