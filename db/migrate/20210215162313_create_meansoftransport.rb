class CreateMeansoftransport < ActiveRecord::Migration[6.0]
  def change
    create_table :meansoftransports do |t|
      t.string :name
    end
  end
end
