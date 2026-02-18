class CreateSurnames < ActiveRecord::Migration[6.0]
  def change
    create_table :surnames do |t|
      t.string :name
    end
  end
end
