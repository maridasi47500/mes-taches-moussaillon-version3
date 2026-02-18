class CreateSport < ActiveRecord::Migration[6.0]
  def change
    create_table :sports do |t|
      t.string :name
      t.string :image
    end
  end
end
