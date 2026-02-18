class CreateM17nphraseshavepeople < ActiveRecord::Migration[6.0]
  def change
    drop_table :m17nphraseshavepeople
    create_table :m17nphraseshavepeople do |t|
      t.integer :m17nphrase_id
      t.integer :person_id
    end
  end
end
