class CreateSportsgrouphaveolympicevents < ActiveRecord::Migration[6.0]
  def change
    create_table :sportsgrouphaveolympicevents do |t|
      t.integer :sport_group_id
      t.integer :olympicevent_id
    end
  end
end
