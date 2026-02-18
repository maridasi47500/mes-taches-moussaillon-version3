class CreateGoogleresults < ActiveRecord::Migration[6.0]
  def change
    create_table :googleresults do |t|
      t.string :title
      t.string :content
      t.string :url
      t.string :date
    end
  end
end
