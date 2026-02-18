class AddPersonIdToTwitterAccount < ActiveRecord::Migration[6.0]
  def change
    add_column :twitteraccounts, :person_id, :integer
  end
end
