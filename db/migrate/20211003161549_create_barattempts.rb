class CreateBarattempts < ActiveRecord::Migration[6.0]
  def change
    create_table :barattempts do |t|
t.integer :user_id
t.integer :sample_id
t.integer :bar_id
t.integer :person_id
    end
    create_table :barattemptshaverecordings do |t|
t.integer :barattempt_id
t.integer :recordingreview_id
    end

    create_table :recordingreviews do |t|
t.integer :correctsample_id
t.integer :incorrectsample_id
t.integer :gooduser_id
    end
    create_table :barreviews do |t|
t.integer :user_id
t.integer :barattempt_id
t.text :description
    end
create_table :barreviewshavebarcriteria do |t|
t.integer :barcriteria_id
t.integer :barreview_id
end
create_table :barreviewshavescorecriteria do |t|
t.integer :scorecriteria_id
t.integer :barreview_id
end
    create_table :scorecriteria do |t|
t.text :description
t.integer :musicalscore_id
t.integer :gooduser_id
    end
    create_table :barcriteria do |t|
t.text :description
t.integer :bar_id
t.integer :gooduser_id
    end
  end
end
