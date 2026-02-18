class AddSailorIdToAnaphorsPeople < ActiveRecord::Migration[6.0]
  def change
    add_column :anaphors_people, :sailor_id, :integer
  end
end
