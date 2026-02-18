class AddRealRecipientsToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :real_recipients, :boolean
  end
end
