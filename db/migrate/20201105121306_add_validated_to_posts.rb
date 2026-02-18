class AddValidatedToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :validated, :boolean
  end
end
