class CreateReactionsTexts < ActiveRecord::Migration[6.0]
  def change
    create_table :reactions_texts do |t|
      t.string :name

      t.timestamps
    end
  end
end
