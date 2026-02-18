class CreateLoveislands < ActiveRecord::Migration[6.0]
  def change
    create_table :loveislands do |t|
      t.integer :wantedcouple_id
      t.integer :notwantedcouple_id
    end
  end
end
