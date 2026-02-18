class AddInterpretationIdToSurnames < ActiveRecord::Migration[6.0]
  def change
    add_column :surnames, :interpretation_id, :integer
  end
end
