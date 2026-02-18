class Addimagetosurname < ActiveRecord::Migration[6.0]
  def change
        add_column :surnames, :image, :file

  end
end
