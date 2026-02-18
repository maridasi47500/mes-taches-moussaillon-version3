class AddNameimageToProfilepictures < ActiveRecord::Migration[6.0]
  def change
    add_column :profilepictures, :nameimage, :string
  end
end
