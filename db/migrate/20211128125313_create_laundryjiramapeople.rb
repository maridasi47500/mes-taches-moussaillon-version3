class CreateLaundryjiramapeople < ActiveRecord::Migration[6.0]
  def change
    create_table :laundryjiramapeople do |t|
      t.integer :grade_id
      t.integer :alias_id

    end
    create_table :whoscaptains do |t|
      t.integer :grade_id
      t.integer :superiorgrade_id
    end
    create_table :laundrycaptains do |t| #demande la literie a son superieur
      t.integer :laundryjiramaperson_id
      t.integer :laundryjiramasuperiorgradeperson_id

    end
    create_table :hairstylisthabilleurtasks do |t| #etre habille
      t.integer :laundryjiramaperson_id
      t.integer :laundryjiramasuperiorgradeperson_id

    end
  end
end
