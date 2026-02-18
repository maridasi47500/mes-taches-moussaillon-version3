class CreatePersongraduatedschool < ActiveRecord::Migration[6.0]
  def change
    create_table :persongraduatedschools do |t|
      t.date :date
      t.integer :schoolhperson_id
    end
    create_table :persongraduatedschoolshavephotos do |t|

      t.integer :persongraduatedschool_id
      t.integer :photo_id
    end
    create_table :persongraduatedschoolshavetrophies do |t|

      t.integer :persongraduatedschool_id
      t.integer :trophy_id
    end
    create_table :peopledidwellgrouptasks do |t|
      # grouptzaskhaverating user_id rating  taskhavegrouptask_id date:date
      t.integer :sailorgrouptask_id
      t.integer :rating
      t.integer :user_id
    end
    create_table :peopledidwellwholegrouptasks do |t|
      t.integer :grouptask_id
      t.integer :rating
      t.integer :user_id
    end
  end
end
