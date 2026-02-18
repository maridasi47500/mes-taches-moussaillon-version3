class CReateSailorjobrelation < ActiveRecord::Migration[6.0]
  def change
    create_table :twosailorjobs do |t|
      t.integer :sailorjob_id
      t.integer :othersailorjob_id 
      t.timestamps
    end
    create_table :taskactionsailorjobs do |t|
      t.integer :sailorjob_id
      t.integer :taskaction_id
      t.timestamps
    end
    create_table :taskhavetaskactiontwosailorjobs do |t|
      t.integer :taskactiontwosailorjob_id
      t.integer :person_id
      t.timestamps
    end
    create_table :myothertaskhavetaskactiontwosailorjobs do |t|
      t.integer :taskhavetaskactiontwosailorjob_id
      t.integer :ifothertaskhavetaskactiontwosailorjob_id
      t.timestamps
    end
    create_table :weaknesscouples do |t|
      t.integer :person_id
      t.integer :heroattitude_id
      t.integer :otherheroattitude_id
      t.integer :otherperson_id
      t.timestamps
    end
  end
end
