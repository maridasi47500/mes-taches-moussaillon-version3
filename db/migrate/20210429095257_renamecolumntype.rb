class Renamecolumntype < ActiveRecord::Migration[6.0]
  def change
    rename_column "mylayouts", "type", "typelayout"
  end
end
