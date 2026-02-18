class CreateMeaning < ActiveRecord::Migration[6.0]
  def change
    create_table :meanings do |t|
      t.text :content
      t.integer :word_id
    end
  end
end
