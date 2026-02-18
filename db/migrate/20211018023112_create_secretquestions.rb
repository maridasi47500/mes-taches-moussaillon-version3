class CreateSecretquestions < ActiveRecord::Migration[6.0]
  def change
    create_table :secretquestions do |t|
    t.string "typeq"
    t.string "text"
t.timestamps

    end
  create_table "secretanswers" do |t|
    t.integer "question_id"
    t.string "text"
    t.boolean "good"
t.timestamps
  end

  end
end
