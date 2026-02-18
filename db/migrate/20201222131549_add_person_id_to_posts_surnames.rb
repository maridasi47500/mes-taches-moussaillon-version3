class AddPersonIdToPostsSurnames < ActiveRecord::Migration[6.0]
  def change
    add_column :posts_surnames, :person_id, :string
  end
end
