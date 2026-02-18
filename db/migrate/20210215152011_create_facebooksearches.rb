class CreateFacebooksearches < ActiveRecord::Migration[6.0]
  def change
    create_table :facebooksearches do |t|
      t.integer :place_id
      t.string :content
    end
  end
end
