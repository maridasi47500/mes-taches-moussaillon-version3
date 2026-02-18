class CreateSailorjobhavealiasesdialogs < ActiveRecord::Migration[6.0]
  def change
    create_table :sailorjobhavealiasesdialogs do |t|
      t.integer :sailorjobhavealias_id
      t.integer :othersailorjobhavealias_id
    end
  end
end
