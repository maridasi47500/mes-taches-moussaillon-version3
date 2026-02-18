class CreatePeoplehavejobhaveepochs < ActiveRecord::Migration[6.0]
  def change
    create_table :peoplehavejobhaveepochs do |t|
      t.integer :epoch_id
      t.integer :peoplehavejob_id
    end
  end
end
