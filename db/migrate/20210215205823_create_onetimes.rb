class CreateOnetimes < ActiveRecord::Migration[6.0]
  def change
    create_table :onetimes do |t|
      t.string :content
      t.string :person_id
    end
  end
end
