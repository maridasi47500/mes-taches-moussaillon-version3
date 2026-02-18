class AddImageToSkills < ActiveRecord::Migration[6.0]
  def change
    add_column :skills, :image, :string
  end
end
