class AddMyRelationToSurnames < ActiveRecord::Migration[6.0]
  def change
    add_column :surnames, :my_relation, :string
  end
end
