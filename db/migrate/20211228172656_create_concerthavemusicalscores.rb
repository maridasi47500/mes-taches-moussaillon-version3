class CreateConcerthavemusicalscores < ActiveRecord::Migration[6.0]
  def change
    create_table :concerthavemusicalscores do |t|
      t.integer :concert_id
      t.integer :musicalscore_id
    end
  end
end
