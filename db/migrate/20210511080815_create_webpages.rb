class CreateWebpages < ActiveRecord::Migration[6.0]
  def change
    create_table :webpages do |t|
      t.string :title
      t.string :url

      t.timestamps
    end
  end
end
