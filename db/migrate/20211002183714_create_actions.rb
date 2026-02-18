class CreateActions < ActiveRecord::Migration[6.0]
  def change
    create_table :actions do |t|
      t.string :name_en
      t.string :name_fr
      t.string :name_de
    end
add_column :attitudes, :image, :string


    create_table :taskshaveactions do |t|
t.integer :action_id
t.integer :task_id
    end
  end
end
