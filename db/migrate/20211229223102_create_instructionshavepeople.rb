class CreateInstructionshavepeople < ActiveRecord::Migration[6.0]
  def change
    create_table :instructionshavepeople do |t|
      t.integer :instruction_id
      t.integer :alias_id
    end
  end
end
