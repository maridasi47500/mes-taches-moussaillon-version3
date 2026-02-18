class AddContentToJingles < ActiveRecord::Migration[6.0]
  def change
    add_column :jingles, :content, :string
  end
end
