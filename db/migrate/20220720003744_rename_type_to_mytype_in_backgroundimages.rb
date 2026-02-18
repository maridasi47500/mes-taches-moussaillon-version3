class RenameTypeToMytypeInBackgroundimages < ActiveRecord::Migration[6.0]
  def change
rename_column :backgroundimages, :type,:mytype
  end
end
