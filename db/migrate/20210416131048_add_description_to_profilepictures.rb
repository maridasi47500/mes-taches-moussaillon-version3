class AddDescriptionToProfilepictures < ActiveRecord::Migration[6.0]
  def change
    add_column :profilepictures, :description, :text
  end
end
