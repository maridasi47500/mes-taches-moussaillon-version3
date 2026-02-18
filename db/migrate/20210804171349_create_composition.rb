class CreateComposition < ActiveRecord::Migration[6.0]
  def change
    create_table :musicalcompositions do |t|
      t.string :title
    end
    add_column :couplethavecomposedcontents, :musicalcomposition_id, :integer
    add_column :refrainhavecomposedcontents, :musicalcomposition_id, :integer
  end
end
