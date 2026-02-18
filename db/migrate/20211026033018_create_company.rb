class CreateCompany < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :type
      t.string :name
      t.string :image
      t.integer :user_id
      t.timestamps
    end
    create_table :companieshaveceos do |t|
      t.integer :ceo_id
      t.integer :job_id
      t.integer :company_id
      t.integer :user_id
      t.integer :nationality_id
      t.timestamps
    end
    create_table :companieshaveemployees do |t|
      t.integer :employee_id
      t.integer :employer_id
      t.integer :job_id
      t.integer :company_id
      t.integer :user_id
      t.integer :nationality_id
      t.timestamps
    end
    create_table :companieshavecustomers do |t|
      t.integer :employee_id
      t.integer :customer_id
      t.integer :company_id
      t.integer :user_id
      t.integer :nationality_id
      t.timestamps
    end
  end
end
