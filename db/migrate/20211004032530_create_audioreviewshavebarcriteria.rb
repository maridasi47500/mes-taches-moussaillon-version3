class CreateAudioreviewshavebarcriteria < ActiveRecord::Migration[6.0]
  def change
    create_table :audioreviewshavebarcriteria do |t|
      t.integer :recordingreview_id
      t.integer :barcriterion_id
      t.integer :score
    end
    create_table :audioreviewshavescorecriteria do |t|
      t.integer :recordingreview_id
      t.integer :scorecriterion_id
      t.integer :score
    end
add_column :barreviewshavebarcriteria, :score, :integer
add_column :barreviewshavescorecriteria, :score, :integer
    create_table :musicalscoreshavemusicalinstruments do |t|
      t.integer :musicalinstrument_id
      t.integer :musicalscore_id
    end
#add_column :musicalscores, :musicalinstrument_id, :integer
  end
end
