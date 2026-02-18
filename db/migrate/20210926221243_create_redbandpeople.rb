class CreateRedbandpeople < ActiveRecord::Migration[6.0]
  def change
    create_table :redbandpeople do |t|
      t.integer :user_id
      t.integer :person_id
    end
  end
end
