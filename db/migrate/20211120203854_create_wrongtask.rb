class CreateWrongtask < ActiveRecord::Migration[6.0]
  def change
    create_table :wrongtasks do |t|
      t.integer :wrongsailorjob_id
      t.integer :suggestedsailorjob_id
      t.timestamps
    end
    create_table :taskactionsailorjobshaveaccomplishments do |t|
      t.integer :taskactionsailorjob_id
      t.integer :person_id
      t.datetime :time
      t.timestamps
    end
    create_table :taskactionsailorjobshaveaccomplishmentshackedpeople do |t|
      t.integer :taskactionsailorjobshaveaccomplishment_id
      t.integer :person_id
      t.timestamps
    end
    create_table :taskactionsailorjobshaveaccomplishmentshackedpeoplesurnames do |t|
      t.integer :taskactionsailorjobshaveaccomplishmentshackedperson_id
      t.integer :surname_id
      t.timestamps
    end
    create_table :taskactionsailorjobshaveaccomplishmentshackedpeopletasks do |t|
      t.integer :taskactionsailorjobshaveaccomplishmentshackedperson_id
      t.integer :task_id
      t.timestamps
    end
  end
end
