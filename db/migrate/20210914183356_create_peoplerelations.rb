class CreatePeoplerelations < ActiveRecord::Migration[6.0]
  def change
    create_table :peoplerelations do |t|
      t.string :name
    end
      rename_column :worktwos, :link, :link_id
      change_column :worktwos, :link_id, :integer
  end
end
