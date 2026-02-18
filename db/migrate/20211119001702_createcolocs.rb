class Createcolocs < ActiveRecord::Migration[6.0]
  def change
create_table :colocataires do |t|
t.integer :person_id
t.integer :otherperson_id
end
create_table :colocataireshavetasks do |t|
t.integer :colocataire_id
t.integer :task_id
end
  end
end
