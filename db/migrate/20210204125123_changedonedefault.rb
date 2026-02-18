class Changedonedefault < ActiveRecord::Migration[6.0]
  def change
    change_column :events, :done, :boolean, :default => false
  end
end
