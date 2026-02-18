class CreateFactorieshaveworkers < ActiveRecord::Migration[6.0]
  def change
    create_table :factorieshaveworkers do |t|
      t.integer :person_id
      t.integer :factory_id
    end
  end
end
