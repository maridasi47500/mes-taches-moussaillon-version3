class CreateGrouptasks < ActiveRecord::Migration[6.0]
  def change
    create_table :grouptasks do |t|
t.integer :task_id
t.string :title_fr
t.string :title_en
t.string :title_de
t.timestamps
    end
    create_table :sailorgrouptasks do |t|
t.integer :grouptask_id
t.integer :person_id
t.timestamps
    end
    create_table :actionssailorgrouptasks do |t|
t.integer :sailorgrouptask_id
t.integer :taskaction_id
t.timestamps
    end
    create_table :thingssailorgrouptasks do |t|
t.integer :sailorgrouptask_id
t.integer :thing_id
t.timestamps
    end
  end
end
