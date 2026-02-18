class AddContentToThisisjingles < ActiveRecord::Migration[6.0]
  def change
    add_column :thisisjingles, :content, :string
  end
end
