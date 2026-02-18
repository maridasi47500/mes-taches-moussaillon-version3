class CreateUltimatumbetweentwoactions < ActiveRecord::Migration[6.0]
  def change
    #create_table :ultimatumbetweentwoactions do |t|
    #  t.integer :action_id
    #  t.integer :secondaction_id
    #    #je te fais pas d'ultimatum entre l'action et l'autre action (ou je t'en fais un pour te dire : soit sailor fait/ne pas pas action1, il pourra faire/ne pas réaliser l'action/la tache2 
    #end
    create_table :sailorandactions do |t|
      t.integer :person_id
      t.integer :action_id

    end
    create_table :fetes do |t|
      t.string :name_en
      t.string :name_fr
      t.string :name_de
      t.date :date
      t.timestamps

    end
    create_table :sailorjobhaveratings do |t|
      t.integer :sailorjob_id
      t.integer :rating
      t.integer :user_id
      t.datetime :datetime
      t.timestamps

    end
    create_table :exchangebetweensailorandactions do |t|
      t.integer :sailorandaction_id
      t.integer :person_id
#mauvais/bon sailor pour cette tâche

    end

  end
end
