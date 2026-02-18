class CreateFrontpages < ActiveRecord::Migration[6.0]
  def change
    create_table :frontpages do |t|
t.timestamps
    end
    create_table :frontpagepeople do |t|
t.integer :frontpage_id
t.integer :person_id
t.timestamps
    end
  end
end
