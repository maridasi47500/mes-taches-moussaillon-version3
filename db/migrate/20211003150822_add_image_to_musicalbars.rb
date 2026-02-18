class AddImageToMusicalbars < ActiveRecord::Migration[6.0]
  def change
    add_column :musical_bars, :image, :string
  end
end
