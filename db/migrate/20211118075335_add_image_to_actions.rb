class AddImageToActions < ActiveRecord::Migration[6.0]
  def change
    add_column :actions, :image, :string
  end
end
