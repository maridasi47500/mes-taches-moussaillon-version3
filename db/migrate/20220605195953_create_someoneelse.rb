class CreateSomeoneelse < ActiveRecord::Migration[6.0]
  def change
    create_table :fakecouples do |t|
      t.integer :someoneelse_id
      t.integer :otherperson_id
    end
  end
end
