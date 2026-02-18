class CreateSeasons < ActiveRecord::Migration[6.0]
  def change
    create_table :seasons do |t|
      t.date :begin_at
      t.date :end_at
      t.string :name
      t.string :image
    end
  end
end
