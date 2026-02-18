class AddPronounIdToPeople < ActiveRecord::Migration[6.0]
  def change
    add_column :people, :pronoun_id, :integer
  end
end
