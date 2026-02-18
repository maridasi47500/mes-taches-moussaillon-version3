class AddImageToComposer < ActiveRecord::Migration[6.0]
  def change
    add_column :composers, :image, :string
  end
end
