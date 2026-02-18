class CreateSpokenspeech < ActiveRecord::Migration[6.0]
  def change
    create_table :rightaboutsomeones do |t|
      t.text :question_fr
      t.text :question_de
      t.text :question_en
      t.text :description_fr
      t.text :description_de
      t.text :description_en
    end
    create_table :rightaboutsomeonehavesentences do |t|
      t.integer :rightaboutsomeone_id
      t.integer :phrase_id
    end
    create_table :rightaboutsomeonehavetruths do |t|
      t.integer :rightaboutsomeone_id
      t.integer :actionlist_id
    end

    create_table :actionlisthaveactions do |t|
      t.integer :actionlist_id
      t.integer :taskaction_id
    end
    create_table :actionlists do |t|
      t.text :title_fr
      t.text :title_de
      t.text :title_en
    end
    #true
    create_table :trueansweraboutsomeonephrases do |t|
      t.integer :rightaboutsomeone_id
      t.integer :phrase_id
    end
    create_table :trueansweraboutsomeoneactionlists do |t|
      t.integer :rightaboutsomeone_id
      t.integer :actionlist_id
    end
  end
end
