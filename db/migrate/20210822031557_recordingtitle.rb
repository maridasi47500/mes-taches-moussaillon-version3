class Recordingtitle < ActiveRecord::Migration[6.0]
  def change
    create_table :lesson_titles do |t|
      t.integer :type
      t.integer :recordingfemme_id
      t.integer :recordinghomme_id
      t.integer :lesson_id
      t.integer :user_id
    end

  end
end
