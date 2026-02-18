class AddFacebookToPeople < ActiveRecord::Migration[6.0]
  def change
    add_column :people, :facebook, :string
  end
end
