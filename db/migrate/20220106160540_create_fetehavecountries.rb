class CreateFetehavecountries < ActiveRecord::Migration[6.0]
  def change
    create_table :fetehavecountries do |t|
      t.integer :fete_id
      t.integer :country_id
    end
  end
end
