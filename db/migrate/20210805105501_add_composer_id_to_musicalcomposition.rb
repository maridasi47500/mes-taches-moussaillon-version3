class AddComposerIdToMusicalcomposition < ActiveRecord::Migration[6.0]
  def change
    add_column :musicalcompositions, :composer_id, :integer
  end
end
