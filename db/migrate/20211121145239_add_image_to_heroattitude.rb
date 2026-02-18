class AddImageToHeroattitude < ActiveRecord::Migration[6.0]
  def change
    add_column :heroattitudes, :image, :string
  end
end
