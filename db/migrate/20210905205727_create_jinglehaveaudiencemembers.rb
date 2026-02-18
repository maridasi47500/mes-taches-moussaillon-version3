class CreateJinglehaveaudiencemembers < ActiveRecord::Migration[6.0]
  def change
    create_table :jinglehaveaudiencemembers do |t|
      t.integer :jingle_id
      t.integer :person_id
    end
  end
end
