class CreatePersonrepas < ActiveRecord::Migration[6.0]
  def change
    create_table :personrepas do |t|
      t.integer :person_id
      t.integer :user_id
      t.date :date
      t.integer :repas_id
      t.string :repasjour
	t.timestamps
    end
  end
end
