class CreateMusicalbums < ActiveRecord::Migration[6.0]
  def change
    create_table :musicalbums do |t|
      t.string :name
      t.string :image
    end
  end
end
