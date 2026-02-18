class AddMyprofilepicIdToPeople < ActiveRecord::Migration[6.0]
  def change
    add_column :people, :myprofilepic_id, :integer
  end
end
