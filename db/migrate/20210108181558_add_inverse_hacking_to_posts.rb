class AddInverseHackingToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :inverse_hacking, :boolean
  end
end
