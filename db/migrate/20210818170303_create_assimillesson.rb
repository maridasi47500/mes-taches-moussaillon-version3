class CreateAssimillesson < ActiveRecord::Migration[6.0]
  def change
    create_table :lessons do |t|
      t.string :title
      t.string :description
      t.string :image
      t.integer :user_id
    end
    create_table :lesson_languages do |t|
      t.integer :locale_from_id
      t.integer :locale_to_id
      t.integer :lesson_id
    end
    create_table :lesson_contents do |t|
      t.string :type
      t.string :content_fr
      t.string :content_en
      t.integer :lesson_id
      t.string :content_de
      t.integer :recordingfemme_id
      t.integer :recordinghomme_id
    end
    create_table :lesson_recordings do |t|
      t.integer :type
      t.integer :recordingfemme_id
      t.integer :recordinghomme_id
      t.integer :lesson_content_id
      t.integer :user_id
    end
  end
end
