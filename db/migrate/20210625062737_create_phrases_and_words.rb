class CreatePhrasesAndWords < ActiveRecord::Migration[6.0]
  def change
    create_table :peoplehavephrasesandwords do |t|
      t.integer :person_id
      t.integer :aidememoire_id
    end
    create_table :aidememoires do |t|
      t.integer :recordingphrase_id
      t.integer :recordingword_id
    end
    create_table :onlywords do |t|
      t.integer :word1_id
      t.integer :word2_id
      t.integer :aidememoire_id
    end
    create_table :onlyphrases do |t|
      t.integer :phrase1_id
      t.integer :phrase2_id
      t.integer :aidememoire_id
    end
    create_table :phraseandwords do |t|
      t.integer :phrase_id
      t.integer :word_id
      t.integer :aidememoire_id
      t.boolean :opposite
    end
    create_table :relations do |t|
      t.string :name_en
      t.string :name_fr
      t.string :name_de
    end
    
    add_column :mylinkedtasks, :recording1_id, :integer
    add_column :mylinkedtasks, :recording2_id, :integer
    add_column :tickets, :image, :integer
    create_table :taskshaverelations do |t|
      t.integer :mylinkedtask_id
      t.integer :relation_id
    end
    create_table :aidememoirehaverelations do |t|
      t.integer :aidememoire_id
      t.integer :relation_id
    end

#    create_table :doublerelatedtaskstables do |t|
#    end

  end
end
