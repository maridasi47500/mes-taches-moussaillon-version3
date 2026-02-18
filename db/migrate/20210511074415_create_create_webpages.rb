class CreateCreateWebpages < ActiveRecord::Migration[6.0]
  def change
    create_table :create_webpages do |t|
      t.string :title
      t.string :url

      t.timestamps
    end
  end
end
