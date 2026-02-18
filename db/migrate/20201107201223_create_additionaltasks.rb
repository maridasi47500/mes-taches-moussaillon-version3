class CreateAdditionaltasks < ActiveRecord::Migration[6.0]
  def change
    create_table :additionaltasks do |t|
      t.integer :maintask_id
      t.integer :othertask_id
    end
    create_table :additionalevents do |t|
      t.integer :mainevent_id
      t.integer :otherevent_id
    end
  end
end
