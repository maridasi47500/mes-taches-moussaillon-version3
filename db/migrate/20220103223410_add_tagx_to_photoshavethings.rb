class AddTagxToPhotoshavethings < ActiveRecord::Migration[6.0]
  def change
    add_column :photoshavethings, :tagx, :integer
    add_column :photoshavethings, :tagy, :integer
  end
end
