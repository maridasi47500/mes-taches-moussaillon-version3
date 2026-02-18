class CreateOlympicgames < ActiveRecord::Migration[6.0]
  def change
    create_table :olympicgames do |t|
      t.string :name
      t.string :season
      t.integer :year
    end
    create_table :editions do |t|
      t.integer :olympicgame_id
      t.date :opened
      t.date :closed
      t.date :begincomp
      t.date :closecomp
      t.boolean :war
      t.timestamps
    end
    create_table :editionshaveevents do |t|
      t.integer :edition_id
      t.integer :city_id
      t.integer :country_id
      t.integer :olympicevent_id
      t.string :sexe
      t.date :date
    end
    create_table :olympicevents do |t|
      t.string :name
    end
    create_table :roundtypes do |t|
      t.string :name
    end
    create_table :rounds do |t|
      t.integer :editionshaveevent_id
      t.integer :roundtype_id
      t.date :begin
      t.date :end
      t.timestamps
    end
    create_table :olympicresults do |t|
      t.integer :round_id
      t.integer :athlete_id
      t.integer :heat
      t.integer :lane
      t.integer :pos
      t.time :time
      t.float :reaction
      t.boolean :qualified
      t.timestamps
    end
#en affichatn les slits
#en combien de temps il a parcouru 1000m au total
#100m,200m,300m,400m,500m,600m,700m
    rename_column :cities, :name, :name_fr
    add_column :cities, :name_en, :string
    add_column :cities, :name_de, :string
    add_column :cities, :name_it, :string
  end
end
