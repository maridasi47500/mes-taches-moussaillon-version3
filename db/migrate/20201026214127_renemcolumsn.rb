class Renemcolumsn < ActiveRecord::Migration[6.0]
  def change
rename_column :comments, :content, :text

  end
end
