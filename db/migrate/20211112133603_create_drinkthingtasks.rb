class CreateDrinkthingtasks < ActiveRecord::Migration[6.0]
  def change
    create_table :drinkthingtasks do |t|
      t.integer :drink_id
      t.integer :task_id
      t.integer :person_id
      t.integer :user_id
      t.integer :qty
    end
  end
end
