class CreateDeuxxuebas < ActiveRecord::Migration[6.0]
  def change
    create_table :deuxxuebas do |t|
      t.integer :persona_id
      t.integer :personb_id
    end
  end
end
