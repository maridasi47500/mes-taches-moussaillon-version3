class AddSurnameToReactions < ActiveRecord::Migration[6.0]
  def change
    add_column :reactions, :surname, :string
  end
end
