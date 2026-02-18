class CreateHernothers < ActiveRecord::Migration[6.0]
  def change
    create_table :hernothers do |t|
      t.integer :person_id
      t.integer :otherperson_id
    end
  end
end
