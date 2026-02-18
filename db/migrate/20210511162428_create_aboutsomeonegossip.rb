class CreateAboutsomeonegossip < ActiveRecord::Migration[6.0]
  def change
    create_table :aboutsomeonegossips do |t|
      t.text :content
    end
  end
end
