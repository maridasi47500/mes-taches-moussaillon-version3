class CreatePlantspecies < ActiveRecord::Migration[6.0]
  def change
    create_table :plantspecies do |t|
      t.string :name
      t.string :image
    end
  end
end
