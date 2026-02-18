class CreateEpisode < ActiveRecord::Migration[6.0]
  def change
    create_table :episodes do |t|
      t.date :date
      t.integer :tvseries_id
      t.integer :saison
      t.integer :ep
      t.string :title
      t.text :description
    end
    create_table :episodehaveactors do |t|
      t.integer :episode_id
      t.integer :tvserieshaveactor_id
    end
    create_table :parodyepisodes do |t|
      t.date :date
      t.integer :tvseriesparody_id
      t.integer :saison
      t.integer :ep
      t.string :title
      t.text :description
    end
    create_table :episodehavetvseriesactors do |t|
      t.integer :episode_id
      t.integer :tvseriesparodiehaveactor_id
    end
  end
end
