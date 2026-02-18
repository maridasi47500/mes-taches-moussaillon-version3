class AddTagxToPhotohavesailors < ActiveRecord::Migration[6.0]
  def change
    add_column :photohavesailors, :tagx, :integer
    add_column :photohavesailors, :tagy, :integer
  end
end
