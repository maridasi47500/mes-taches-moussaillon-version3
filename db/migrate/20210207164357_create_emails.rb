class CreateEmails < ActiveRecord::Migration[6.0]
  def change
    create_table :emails do |t|
      t.string :from
      t.string :to
      t.string :content
      t.string :subject

      t.timestamps
    end
  end
end
