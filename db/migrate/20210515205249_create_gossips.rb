class CreateGossips < ActiveRecord::Migration[6.0]
  def change
    create_table :gossips do |t|
      t.text :content
    end
  end
end
