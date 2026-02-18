class AddContentToRecordings < ActiveRecord::Migration[6.0]
  def change
    add_column :recordings, :content, :string
  end
end
