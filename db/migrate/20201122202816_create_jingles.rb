class CreateJingles < ActiveRecord::Migration[6.0]
  def change
    create_table :jingles do |t|
      t.integer :person_id
      t.string :name
    end
  end
end
