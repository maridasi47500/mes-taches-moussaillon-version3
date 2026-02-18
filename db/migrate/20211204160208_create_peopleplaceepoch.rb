class CreatePeopleplaceepoch < ActiveRecord::Migration[6.0]
  def change
    create_table :peoplecitiesepochs do |t|
      t.integer :people_city_id
      t.integer :epoch_id
    end
  end
end
