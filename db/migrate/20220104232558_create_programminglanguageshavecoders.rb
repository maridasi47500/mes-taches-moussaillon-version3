class CreateProgramminglanguageshavecoders < ActiveRecord::Migration[6.0]
  def change
    create_table :programminglanguageshavecoders do |t|
      t.integer :person_id
      t.integer :programminglanguage_id
    end
  end
end
