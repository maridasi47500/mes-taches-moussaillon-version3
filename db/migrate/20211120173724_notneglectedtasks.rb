class Notneglectedtasks < ActiveRecord::Migration[6.0]
  def change
    create_table :conditionnotneglectedtasks do |t|
      t.integer :welldonesailorjob_id
      t.integer :neglectedsailorjob_id
    end
  end
end
