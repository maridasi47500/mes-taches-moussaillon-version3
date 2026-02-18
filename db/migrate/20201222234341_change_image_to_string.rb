class ChangeImageToString < ActiveRecord::Migration[6.0]
  def change
    change_column :surnames, :image, :string
  end
end
