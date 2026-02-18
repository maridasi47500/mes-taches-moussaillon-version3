class CreateAnswerpeople < ActiveRecord::Migration[6.0]
  def change
    create_table :answerpeople do |t|
      t.integer :question_id
      t.integer :answer_id
      t.integer :user_id
      t.integer :person_id
    end
  end
end
