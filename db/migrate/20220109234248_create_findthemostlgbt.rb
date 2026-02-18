class CreateFindthemostlgbt < ActiveRecord::Migration[6.0]
  def change
    create_table :findthemostlgbts do |t|
    t.integer "betterperson_id"
    t.integer "themost"
    t.integer "alias_id"
     t.timestamps

    end
  end
end
