class CreateAnswersecretquestions < ActiveRecord::Migration[6.0]
  def change
    create_table :usersecretquestions do |t|
      t.integer :user_id
      t.integer :secretquestion_id
      t.timestamps
    end
    create_table :answersecretquestions do |t|

      t.integer :usersecretquestion_id
      t.integer :secretanswer_id

    end
  end
end
