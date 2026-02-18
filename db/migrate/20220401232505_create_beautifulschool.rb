class CreateBeautifulschool < ActiveRecord::Migration[6.0]
  def change
    create_table :beautifulschools do |t|
      t.integer :school_id
      t.integer :user_id
      t.integer :note
      t.integer :person_id
    end
  end
end
