class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :typeq
      t.string :text
    end
    create_table :answers do |t|
      t.integer :question_id
      t.string :text
      t.boolean :good
    end
  end
end
