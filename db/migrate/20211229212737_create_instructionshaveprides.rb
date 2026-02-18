class CreateInstructionshaveprides < ActiveRecord::Migration[6.0]
  def change
    create_table :instructionshaveprides do |t|
      t.integer :pride_id
      t.integer :instruction_id
    end
  end
end
