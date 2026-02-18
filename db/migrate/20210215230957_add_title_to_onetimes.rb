class AddTitleToOnetimes < ActiveRecord::Migration[6.0]
  def change
    add_column :onetimes, :title, :string
  end
end
