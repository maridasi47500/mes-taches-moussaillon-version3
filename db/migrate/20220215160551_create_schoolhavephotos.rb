class CreateSchoolhavephotos < ActiveRecord::Migration[6.0]
  def change
    create_table :schoolhavephotos do |t|
      t.integer :school_id
      t.integer :photo_id
    end
    create_table :webpageshavecomments do |t|
      t.integer :webpage_id
      t.integer :comment_id
    end
  end
end
