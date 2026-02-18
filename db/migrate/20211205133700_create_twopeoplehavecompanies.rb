class CreateTwopeoplehavecompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :twopeoplehavecompanies do |t|
      t.integer :company_id
      t.integer :twoperson_id
    end
    create_table :twopeoplehavecities do |t|
      t.integer :city_id
      t.integer :twoperson_id
    end
    create_table :twopeoplehavejobs do |t|
      t.integer :job_id
      t.integer :twoperson_id
    end
  end
end
