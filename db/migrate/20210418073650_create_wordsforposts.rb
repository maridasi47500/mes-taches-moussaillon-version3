class CreateWordsforposts < ActiveRecord::Migration[6.0]
  def change
    create_table :wordsforposts do |t|
      t.integer :word_id
      t.integer :post_id
    end
  end
end
