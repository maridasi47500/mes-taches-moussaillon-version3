class CreateSectors < ActiveRecord::Migration[6.0]
  def change
    create_table :sectors do |t|
      t.string :name
      t.text :description
      t.integer :field_id
      t.date :open_signup
      t.boolean :admission_exam
      t.date :admission_exam_date
      t.timestamps
    end
    create_table :usershavesectors do |t|
     t.integer :user_id
     t.integer :sector_id
    end
    create_table :sectorshavecities do |t|
     t.integer :sector_id
     t.integer :city_id
    end
    create_table :sectorshavebacseries do |t|
     t.integer :sector_id
     t.integer :bacseries_id
    end
    create_table :sectorshaveadmissionfiles do |t|
     t.integer :sector_id
     t.integer :admissionfile_id
    end
    
    create_table :fields do |t|
     t.string :name 
      t.timestamps
    end
    create_table :admissionfiles do |t|
     t.string :name 
      t.timestamps
    end
    create_table :bacseries do |t|
     t.string :name 
      t.timestamps
    end
  end
end
