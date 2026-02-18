class CreateConcertshavecities < ActiveRecord::Migration[6.0]
  def change
    create_table :concertshavecities do |t|
      t.integer :city_id
      t.integer :concert_id
    end
  end
end
