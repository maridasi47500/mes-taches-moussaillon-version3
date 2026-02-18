class AddTypeToArtists < ActiveRecord::Migration[6.0]
  def change
    add_column :artists, :type, :string
  end
end
