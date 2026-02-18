class CreateMysectors < ActiveRecord::Migration[6.0]
  def change
    create_table :usersjobs do |t|
      t.integer :user_id
      t.integer :job_id
    end
    create_table :mysectors do |t|
      t.integer :usersjob_id
      t.integer :sector_id
    end
  end
end
