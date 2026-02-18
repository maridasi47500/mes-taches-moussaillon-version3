class CreateBackgroundimages < ActiveRecord::Migration[6.0]
  def change
    create_table :backgroundimages do |t|
      t.string :image
      t.string :url
      t.string :type

      t.timestamps
    end
  end
end
