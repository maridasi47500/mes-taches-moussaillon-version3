class CreateMysentenceshrecordings < ActiveRecord::Migration[6.0]
  def change
    create_table :mysentenceshrecordings do |t|
      t.integer :mysentence_id
      t.integer :recording_id
    end
  end
end
