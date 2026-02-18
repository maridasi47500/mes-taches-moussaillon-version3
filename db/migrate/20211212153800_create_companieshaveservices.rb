class CreateCompanieshaveservices < ActiveRecord::Migration[6.0]
  def change
    create_table :factorieshaveservices do |t|
      t.integer :factory_id
      t.integer :factoryservice_id
    end
    create_table :factoriesservicehaveemployees do |t|
      t.integer :factoryservice_id
      t.integer :person_id
    end
    create_table :factoriesservicehaveemployeeepochs do |t|
      t.integer :factoriesservicehaveemployee_id
      t.integer :epoch_id
    end
  end
end
