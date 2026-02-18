class CreateMeaningsforsurnames < ActiveRecord::Migration[6.0]
  def change
    create_table :meaningsforsurnames do |t|
      t.string :content
    end
  end
end
