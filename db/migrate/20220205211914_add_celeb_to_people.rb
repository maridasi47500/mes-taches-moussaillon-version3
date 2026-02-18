class AddCelebToPeople < ActiveRecord::Migration[6.0]
  def change
    add_column :people, :celeb, :boolean
  end
end
