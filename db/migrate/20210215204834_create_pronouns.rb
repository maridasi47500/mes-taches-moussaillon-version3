class CreatePronouns < ActiveRecord::Migration[6.0]
  def change
    create_table :pronouns do |t|
      t.string :name
    end
  end
end
