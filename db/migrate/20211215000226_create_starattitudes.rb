class CreateStarattitudes < ActiveRecord::Migration[6.0]
  def change
    create_table :starattitudes do |t|
      t.integer :user_id
      t.integer :winningattitude_id
      t.integer :star
      t.integer :task_id
    end
    create_table :winningattitudespeople do |t|
      t.integer :winningattitude_id
      t.integer :person_id
    end
##{attitude} 1 etoile c'est pas ca qu'ona dit qu'il faut faire pour #{task}
##{attitude} pour #{task} j'ai pas dit ca
#comment tu sais qu'il faut #{attitude} pour #{task}
  end
end
