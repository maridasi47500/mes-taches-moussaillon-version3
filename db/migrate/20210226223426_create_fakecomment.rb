class CreateFakecomment < ActiveRecord::Migration[6.0]
  def change
    create_table :fakecomments do |t|
      t.string :author
      t.text :content
    end
  end
end
